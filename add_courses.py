import uuid
from datetime import datetime
import psycopg2
from psycopg2.extras import RealDictCursor

# NeonDB Connection URI
NEON_URI = "postgresql://neondb_owner:npg_1IArN0ivsfCp@ep-sparkling-breeze-aygdzep7-pooler.c-5.us-east-2.aws.neon.tech/neondb?sslmode=require&channel_binding=require"


def get_connection(uri=NEON_URI):
    """Create a new PostgreSQL connection."""
    return psycopg2.connect(uri)


def initialize_database(neon_uri=NEON_URI):
    """Initialize PostgreSQL with courses table and indexes."""
    conn = get_connection(neon_uri)

    with conn.cursor() as cur:
        # Create courses table (matches app.py schema)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS courses (
                course_id VARCHAR(32) PRIMARY KEY,
                course_name VARCHAR(255) NOT NULL,
                course_code VARCHAR(50) NOT NULL,
                course_branch VARCHAR(100) NOT NULL,
                course_semester VARCHAR(20) NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                UNIQUE (course_code, course_branch, course_semester)
            );
        """)

        # Indexes
        cur.execute("CREATE INDEX IF NOT EXISTS idx_courses_code ON courses(course_code);")
        cur.execute("CREATE INDEX IF NOT EXISTS idx_courses_branch ON courses(course_branch);")
        cur.execute("CREATE INDEX IF NOT EXISTS idx_courses_semester ON courses(course_semester);")
        cur.execute("CREATE INDEX IF NOT EXISTS idx_courses_combo ON courses(course_code, course_branch, course_semester);")

    conn.commit()
    print("NeonDB initialized with courses table and indexes")
    return conn


def add_course(conn, course_data):
    """Add a single course to the database."""
    try:
        course_code = course_data.get('course_code')
        course_branch = course_data.get('course_branch', '')
        course_semester = course_data.get('course_semester', '')

        # Check if course already exists with same combination
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """SELECT course_id FROM courses 
                   WHERE course_code = %s AND course_branch = %s AND course_semester = %s 
                   LIMIT 1""",
                (course_code, course_branch, course_semester)
            )
            existing_course = cur.fetchone()

        if existing_course:
            print(f"Course with code {course_code} already exists")
            return False

        # Prepare course record
        course_id = str(uuid.uuid4().hex)
        now = datetime.now()

        with conn.cursor() as cur:
            cur.execute(
                """INSERT INTO courses 
                   (course_id, course_name, course_code, course_branch, course_semester,
                    created_at, updated_at)
                   VALUES (%s, %s, %s, %s, %s, %s, %s)""",
                (
                    course_id,
                    course_data['course_name'],
                    course_code,
                    course_branch,
                    course_semester,
                    now,
                    now
                )
            )
        conn.commit()
        print(f"Added course: {course_data['course_name']} (ID: {course_id})")
        return True

    except Exception as e:
        conn.rollback()
        print(f"Error adding course: {str(e)}")
        return False


def add_sample_courses(conn):
    """Add sample courses to the database."""
    sample_courses = [
        {
            'course_name': 'Automata Theory',
            'course_code': 'AT',
            'course_branch': 'Information Technology',
            'course_semester': 'Semester IV'
        },
        {
            'course_name': 'Operating Systems',
            'course_code': 'OS',
            'course_branch': 'Information Technology',
            'course_semester': 'Semester IV'
        },
        {
            'course_name': 'Computer Networks and Network Designs',
            'course_code': 'CNND',
            'course_branch': 'Information Technology',
            'course_semester': 'Semester IV'
        },
        {
            'course_name': 'Engineering Maths IV',
            'course_code': 'M4',
            'course_branch': 'Information Technology',
            'course_semester': 'Semester IV'
        },
        {
            'course_name': 'Computer Organization and Architecture',
            'course_code': 'COA',
            'course_branch': 'Information Technology',
            'course_semester': 'Semester IV'
        },
        {
            'course_name': 'Python Lab',
            'course_code': 'PY',
            'course_branch': 'Information Technology',
            'course_semester': 'Semester IV'
        },
        {
            'course_name': 'Data Structures',
            'course_code': 'DS',
            'course_branch': 'Computer Science',
            'course_semester': 'Semester III'
        },
        {
            'course_name': 'Database Management Systems',
            'course_code': 'DBMS',
            'course_branch': 'Computer Science',
            'course_semester': 'Semester III'
        },
        {
            'course_name': 'Digital Logic Design',
            'course_code': 'DLD',
            'course_branch': 'Electronics',
            'course_semester': 'Semester II'
        }
    ]

    added_count = 0
    for course in sample_courses:
        if add_course(conn, course):
            added_count += 1

    print(f"\nAdded {added_count} out of {len(sample_courses)} sample courses")
    return added_count


def get_course_by_code(conn, course_code):
    """Retrieve a course by its code."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT * FROM courses WHERE course_code = %s LIMIT 1", (course_code,))
        return cur.fetchone()


def get_courses_by_branch(conn, branch):
    """Get all courses for a specific branch."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT * FROM courses WHERE course_branch = %s", (branch,))
        return cur.fetchall()


def get_courses_by_semester(conn, semester):
    """Get all courses for a specific semester."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT * FROM courses WHERE course_semester = %s", (semester,))
        return cur.fetchall()


def get_courses_by_branch_and_semester(conn, branch, semester):
    """Get courses by branch and semester."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute(
            """SELECT * FROM courses 
               WHERE course_branch = %s AND course_semester = %s""",
            (branch, semester)
        )
        return cur.fetchall()


def update_course(conn, course_id, update_data):
    """Update a course."""
    try:
        # Remove id fields from update data
        update_data.pop('_id', None)
        update_data.pop('course_id', None)

        if not update_data:
            print("No fields to update")
            return False

        # Build dynamic SET clause
        set_clauses = []
        values = []
        for key, value in update_data.items():
            set_clauses.append(f"{key} = %s")
            values.append(value)

        set_clauses.append("updated_at = %s")
        values.append(datetime.now())

        values.append(course_id)

        sql = f"UPDATE courses SET {', '.join(set_clauses)} WHERE course_id = %s"

        with conn.cursor() as cur:
            cur.execute(sql, values)
            modified = cur.rowcount
        conn.commit()

        if modified > 0:
            print(f"Course {course_id} updated successfully")
            return True
        else:
            print("No changes made to the course")
            return False

    except Exception as e:
        conn.rollback()
        print(f"Error updating course: {str(e)}")
        return False


def delete_course(conn, course_id):
    """Delete a course by ID."""
    try:
        with conn.cursor() as cur:
            cur.execute("DELETE FROM courses WHERE course_id = %s", (course_id,))
            deleted = cur.rowcount
        conn.commit()

        if deleted > 0:
            print(f"Course {course_id} deleted successfully")
            return True
        else:
            print("Course not found")
            return False

    except Exception as e:
        conn.rollback()
        print(f"Error deleting course: {str(e)}")
        return False


def get_all_courses(conn):
    """Get all courses."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT * FROM courses ORDER BY course_name ASC")
        return cur.fetchall()


def get_course_statistics(conn):
    """Get statistics about courses."""
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("""
            SELECT 
                course_branch AS branch,
                course_semester AS semester,
                COUNT(*) AS course_count,
                ARRAY_AGG(course_name) AS courses
            FROM courses
            GROUP BY course_branch, course_semester
            ORDER BY course_branch, course_semester
        """)
        return cur.fetchall()


def search_courses(conn, search_term):
    """Search courses by name or code (case-insensitive)."""
    pattern = f"%{search_term}%"
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute(
            """SELECT * FROM courses 
               WHERE course_name ILIKE %s 
                  OR course_code ILIKE %s 
                  OR course_branch ILIKE %s""",
            (pattern, pattern, pattern)
        )
        return cur.fetchall()


def drop_courses_table(conn, table_name="courses"):
    """Drop the courses table (use with caution)."""
    try:
        with conn.cursor() as cur:
            cur.execute(f"DROP TABLE IF EXISTS {table_name} CASCADE")
        conn.commit()
        print(f"Table '{table_name}' dropped successfully")
        return True
    except Exception as e:
        conn.rollback()
        print(f"Error dropping table: {str(e)}")
        return False


def main():
    try:
        # Initialize database
        conn = initialize_database(NEON_URI)

        # Add sample courses
        add_sample_courses(conn)

        # Display some statistics
        print("\n" + "=" * 50)
        print("COURSE DATABASE STATISTICS")
        print("=" * 50)

        with conn.cursor() as cur:
            cur.execute("SELECT COUNT(*) FROM courses")
            total_courses = cur.fetchone()[0]
            print(f"Total courses in database: {total_courses}")

            cur.execute("SELECT DISTINCT course_branch FROM courses ORDER BY course_branch")
            branches = [row[0] for row in cur.fetchall()]
            print(f"Available branches: {', '.join(branches)}")

            cur.execute("SELECT DISTINCT course_semester FROM courses ORDER BY course_semester")
            semesters = [row[0] for row in cur.fetchall()]
            print(f"Available semesters: {', '.join(semesters)}")

        # Show courses by branch/semester
        stats = get_course_statistics(conn)
        print("\nCourses by Branch and Semester:")
        for stat in stats:
            branch = stat['branch']
            semester = stat['semester']
            count = stat['course_count']
            courses = ', '.join(stat['courses'])
            print(f"  {branch} - {semester}: {count} course(s)")
            print(f"    Courses: {courses}")

        print("\n" + "=" * 50)
        print("Course database setup complete!")
        print("=" * 50)

        # Show a sample of courses
        print("\nSample courses (first 5):")
        sample_courses = get_all_courses(conn)[:5]
        for course in sample_courses:
            print(f"  - {course['course_name']} ({course['course_code']}) "
                  f"- {course['course_branch']} - {course['course_semester']}")

        # Example search
        print("\nSearch example: Courses with 'Computer' in name:")
        search_results = search_courses(conn, "Computer")
        for course in search_results:
            print(f"  - {course['course_name']} ({course['course_code']})")

        # Close connection
        conn.close()

    except Exception as e:
        print(f"Error connecting to NeonDB: {str(e)}")
        print("\nCheck your connection URI and ensure the Neon project is active.")
        print("You may need to whitelist your IP in the Neon dashboard.")


if __name__ == "__main__":
    main()