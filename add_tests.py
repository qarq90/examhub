import json
import uuid
import os
from datetime import datetime
import psycopg2
from psycopg2.extras import RealDictCursor, Json

# NeonDB Connection URI
NEON_URI = "postgresql://neondb_owner:npg_1IArN0ivsfCp@ep-sparkling-breeze-aygdzep7-pooler.c-5.us-east-2.aws.neon.tech/neondb?sslmode=require&channel_binding=require"


def get_connection(uri=NEON_URI):
    """Create a new PostgreSQL connection."""
    return psycopg2.connect(uri)


def initialize_postgres(uri=NEON_URI):
    """Initialize PostgreSQL connection and create indexes."""
    conn = get_connection(uri)

    with conn.cursor() as cur:
        # Ensure tests table exists (matches app.py schema)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS tests (
                test_id VARCHAR(32) PRIMARY KEY,
                test_name VARCHAR(255) NOT NULL,
                test_description TEXT,
                course_name VARCHAR(255),
                course_code VARCHAR(50),
                course_semester VARCHAR(20),
                course_branch VARCHAR(100),
                questions JSONB NOT NULL,
                test_duration VARCHAR(50),
                created_at VARCHAR(50),
                created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );
        """)

        # Additional columns used by this importer
        cur.execute("ALTER TABLE tests ADD COLUMN IF NOT EXISTS total_questions INTEGER;")
        cur.execute("ALTER TABLE tests ADD COLUMN IF NOT EXISTS source_file VARCHAR(255);")
        cur.execute("ALTER TABLE tests ADD COLUMN IF NOT EXISTS processed_at TIMESTAMP;")

        # Indexes
        cur.execute("CREATE INDEX IF NOT EXISTS idx_tests_course_code ON tests(course_code);")
        cur.execute("CREATE INDEX IF NOT EXISTS idx_tests_branch ON tests(course_branch);")
        cur.execute("CREATE INDEX IF NOT EXISTS idx_tests_semester ON tests(course_semester);")
        cur.execute("CREATE INDEX IF NOT EXISTS idx_tests_created ON tests(created_timestamp DESC);")

    conn.commit()
    return conn


def process_json_files(directory_path, neon_uri=NEON_URI):
    """
    Process JSON files and insert them into NeonDB.

    Args:
        directory_path: Path to directory containing JSON files
        neon_uri: PostgreSQL connection URI
    """
    conn = initialize_postgres(neon_uri)

    stats = {
        "processed": 0,
        "errors": 0,
        "skipped": 0
    }

    json_files = [f for f in os.listdir(directory_path) if f.endswith('.json')]

    if not json_files:
        print(f"No JSON files found in {directory_path}")
        conn.close()
        return stats

    print(f"Found {len(json_files)} JSON file(s) to process")
    print("-" * 50)

    for filename in json_files:
        file_path = os.path.join(directory_path, filename)

        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                data = json.load(file)

            # Validate required fields
            if 'questions' not in data:
                print(f"⚠️  Skipping {filename}: Missing 'questions' key")
                stats["skipped"] += 1
                continue

            if not data['questions']:
                print(f"⚠️  Skipping {filename}: Empty questions array")
                stats["skipped"] += 1
                continue

            test_name = data.get('test_name', filename.replace('.json', ''))
            course_code = data.get('course_code', 'PCPF')
            course_branch = data.get('course_branch', 'Information Technology')

            # Check if test already exists (by name + course combination)
            with conn.cursor(cursor_factory=RealDictCursor) as cur:
                cur.execute(
                    """SELECT test_id FROM tests 
                       WHERE test_name = %s AND course_code = %s AND course_branch = %s 
                       LIMIT 1""",
                    (test_name, course_code, course_branch)
                )
                existing_test = cur.fetchone()

            if existing_test:
                print(f"⚠️  Skipping {filename}: Test already exists")
                stats["skipped"] += 1
                continue

            # Prepare test record
            test_id = str(uuid.uuid4().hex)
            questions = data['questions']
            total_questions = len(questions)
            test_duration = int(data.get('test_duration', 20))
            now = datetime.now()

            with conn.cursor() as cur:
                cur.execute(
                    """INSERT INTO tests 
                       (test_id, test_name, test_description, course_name, course_code,
                        course_semester, course_branch, questions, test_duration,
                        created_at, created_timestamp, total_questions,
                        source_file, processed_at)
                       VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                    (
                        test_id,
                        test_name,
                        data.get('test_description', ''),
                        data.get('course_name', 'Paradigms and Computer Programming Fundamentals'),
                        course_code,
                        data.get('course_semester', 'Semester III'),
                        course_branch,
                        Json(questions),            # JSONB column
                        str(test_duration),         # app.py schema uses VARCHAR
                        now.strftime("%Y-%m-%d %H:%M:%S"),
                        now,
                        total_questions,
                        filename,
                        now
                    )
                )
            conn.commit()

            print(f"Successfully processed {filename}")
            print(f"   - Test ID: {test_id}")
            print(f"   - Questions: {total_questions}")
            print(f"   - Duration: {test_duration} minutes")
            stats["processed"] += 1

        except json.JSONDecodeError as e:
            conn.rollback()
            print(f"Error decoding JSON in {filename}: {str(e)}")
            stats["errors"] += 1
        except KeyError as e:
            conn.rollback()
            print(f"Missing key {e} in {filename}")
            stats["errors"] += 1
        except ValueError as e:
            conn.rollback()
            print(f"Invalid value in {filename}: {str(e)}")
            stats["errors"] += 1
        except Exception as e:
            conn.rollback()
            print(f"Error processing {filename}: {str(e)}")
            stats["errors"] += 1

    conn.close()

    # Print summary
    print("-" * 50)
    print("PROCESSING SUMMARY")
    print("-" * 50)
    print(f"Successfully processed: {stats['processed']}")
    print(f"Errors: {stats['errors']}")
    print(f"Skipped: {stats['skipped']}")
    print(f"Total files: {len(json_files)}")

    return stats


def process_json_file_single(file_path, conn):
    """Process a single JSON file and insert into PostgreSQL."""
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)

        test_id = str(uuid.uuid4().hex)
        now = datetime.now()

        with conn.cursor() as cur:
            cur.execute(
                """INSERT INTO tests 
                   (test_id, test_name, test_description, course_name, course_code,
                    course_semester, course_branch, questions, test_duration,
                    created_at, created_timestamp, total_questions)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                (
                    test_id,
                    data.get('test_name', ''),
                    data.get('test_description', ''),
                    data.get('course_name', ''),
                    data.get('course_code', ''),
                    data.get('course_semester', ''),
                    data.get('course_branch', ''),
                    Json(data.get('questions', [])),
                    str(data.get('test_duration', 0)),
                    now.strftime("%Y-%m-%d %H:%M:%S"),
                    now,
                    len(data.get('questions', []))
                )
            )
        conn.commit()
        return True, test_id

    except Exception as e:
        conn.rollback()
        return False, str(e)


# ---------------- Query Helpers ----------------

def get_test_by_name(conn, test_name):
    """Retrieve a test by its name."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT * FROM tests WHERE test_name = %s LIMIT 1", (test_name,))
        return cur.fetchone()


def get_tests_by_course(conn, course_code, branch=None):
    """Get all tests for a specific course."""
    if branch:
        sql = """SELECT * FROM tests 
                 WHERE course_code = %s AND course_branch = %s 
                 ORDER BY created_timestamp DESC"""
        params = (course_code, branch)
    else:
        sql = """SELECT * FROM tests 
                 WHERE course_code = %s 
                 ORDER BY created_timestamp DESC"""
        params = (course_code,)

    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute(sql, params)
        return cur.fetchall()


def get_tests_by_branch(conn, branch):
    """Get all tests for a specific branch."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute(
            "SELECT * FROM tests WHERE course_branch = %s ORDER BY created_timestamp DESC",
            (branch,)
        )
        return cur.fetchall()


def get_tests_by_semester(conn, semester):
    """Get all tests for a specific semester."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute(
            "SELECT * FROM tests WHERE course_semester = %s ORDER BY created_timestamp DESC",
            (semester,)
        )
        return cur.fetchall()


def get_recent_tests(conn, limit=10):
    """Get the most recent tests."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute(
            "SELECT * FROM tests ORDER BY created_timestamp DESC LIMIT %s",
            (limit,)
        )
        return cur.fetchall()


def delete_test_by_id(conn, test_id):
    """Delete a test by its ID."""
    with conn.cursor() as cur:
        cur.execute("DELETE FROM tests WHERE test_id = %s", (test_id,))
        deleted = cur.rowcount
    conn.commit()
    return deleted > 0


def update_test_duration(conn, test_id, new_duration):
    """Update test duration."""
    with conn.cursor() as cur:
        cur.execute(
            """UPDATE tests 
               SET test_duration = %s, processed_at = %s 
               WHERE test_id = %s""",
            (str(new_duration), datetime.now(), test_id)
        )
        modified = cur.rowcount
    conn.commit()
    return modified > 0


def get_test_statistics(conn):
    """Get statistics about tests in the database."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("""
            SELECT 
                course_code,
                course_branch,
                COUNT(*) AS total_tests,
                AVG(total_questions) AS avg_questions,
                AVG(NULLIF(test_duration, '')::numeric) AS avg_duration,
                ARRAY_AGG(test_name) AS test_names
            FROM tests
            GROUP BY course_code, course_branch
            ORDER BY course_code, course_branch
        """)
        return cur.fetchall()


def validate_json_structure(file_path):
    """Validate the structure of a JSON file before processing."""
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)

        required_fields = ['questions']
        missing_fields = [field for field in required_fields if field not in data]

        if missing_fields:
            return False, f"Missing fields: {', '.join(missing_fields)}"

        if not isinstance(data['questions'], list):
            return False, "Questions must be an array"

        question_required = ['question', 'options_a', 'options_b',
                             'options_c', 'options_d', 'correct_answer']
        for idx, question in enumerate(data['questions']):
            missing_q_fields = [f for f in question_required if f not in question]
            if missing_q_fields:
                return False, f"Question {idx + 1} missing: {', '.join(missing_q_fields)}"

        return True, "Valid JSON structure"

    except json.JSONDecodeError as e:
        return False, f"Invalid JSON: {str(e)}"
    except Exception as e:
        return False, f"Error: {str(e)}"


def batch_process_json(directory_path, neon_uri=NEON_URI):
    """Process JSON files with validation and error handling."""
    conn = initialize_postgres(neon_uri)

    json_files = [f for f in os.listdir(directory_path) if f.endswith('.json')]

    results = {
        "success": [],
        "failed": [],
        "skipped": []
    }

    for filename in json_files:
        file_path = os.path.join(directory_path, filename)

        # Validate JSON structure first
        is_valid, message = validate_json_structure(file_path)

        if not is_valid:
            print(f"{filename}: {message}")
            results["failed"].append({"filename": filename, "error": message})
            continue

        # Process the file
        success, result = process_json_file_single(file_path, conn)

        if success:
            print(f"Successfully processed {filename}")
            results["success"].append({"filename": filename, "test_id": result})
        else:
            print(f"Failed to process {filename}: {result}")
            results["failed"].append({"filename": filename, "error": result})

    conn.close()
    return results


if __name__ == "__main__":
    # Configuration
    JSON_DIRECTORY = "static/json/sem3/pcpf"
    NEON_URI = "postgresql://neondb_owner:npg_1IArN0ivsfCp@ep-sparkling-breeze-aygdzep7-pooler.c-5.us-east-2.aws.neon.tech/neondb?sslmode=require&channel_binding=require"

    print("Starting JSON processing...")
    print(f"Directory: {JSON_DIRECTORY}")
    print(f"NeonDB: {NEON_URI.split('@')[-1]}")   # don't print credentials
    print("=" * 60)

    if not os.path.exists(JSON_DIRECTORY):
        print(f"❌ Directory {JSON_DIRECTORY} does not exist!")
        print("Please check the path and try again.")
    else:
        stats = process_json_files(JSON_DIRECTORY, NEON_URI)

        # Display additional statistics
        if stats["processed"] > 0:
            print("\nAdditional Statistics:")
            print("-" * 40)

            conn = get_connection(NEON_URI)
            with conn.cursor(cursor_factory=RealDictCursor) as cur:
                cur.execute("SELECT COUNT(*) AS cnt FROM tests")
                total_tests = cur.fetchone()["cnt"]
                print(f"Total tests in database: {total_tests}")

                cur.execute("SELECT DISTINCT course_code FROM tests ORDER BY course_code")
                course_codes = [row["course_code"] for row in cur.fetchall()]
                print(f"Unique course codes: {', '.join(course_codes)}")

            recent_tests = get_recent_tests(conn, 3)
            if recent_tests:
                print("\n🆕 Recently added tests:")
                for test in recent_tests:
                    print(f"  - {test['test_name']} ({test['course_code']}) "
                          f"- {test.get('total_questions', '?')} questions")

            conn.close()

        print("\n" + "=" * 60)
        print("✅ Processing complete!")