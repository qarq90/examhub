from flask import Flask, render_template, request, redirect, session, url_for, flash, get_flashed_messages, jsonify
from datetime import datetime
import json
import uuid
import re
import psycopg2
from psycopg2.extras import RealDictCursor, Json
from psycopg2 import pool
from werkzeug.security import generate_password_hash, check_password_hash

EMAIL_REGEX = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
PHONE_REGEX = r"^[1-9][0-9]{9,14}$"

app = Flask(__name__)
app.secret_key = "17012005245166"

# NeonDB Connection
DATABASE_URL = "postgresql://neondb_owner:npg_1IArN0ivsfCp@ep-sparkling-breeze-aygdzep7-pooler.c-5.us-east-2.aws.neon.tech/neondb?sslmode=require&channel_binding=require"

# Connection pool for better performance
db_pool = pool.SimpleConnectionPool(
    minconn=1,
    maxconn=10,
    dsn=DATABASE_URL
)

def get_conn():
    """Get a connection from the pool."""
    return db_pool.getconn()

def release_conn(conn):
    """Return connection to the pool."""
    db_pool.putconn(conn)


# ---------------- Helper functions ----------------

def ceaser_cipher(input_text, key, encrypt):
    """Simple Caesar cipher encryption/decryption"""
    characters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "/", "+", "-", "*", "(", ")", "!", "@", "#", "$", "%", "^", "&", " ", ".", "`", "~", "<", ">", ",", ":", ";", "'", '"', "?", "{", "}", "[", "]", "|"]

    result = ""
    for char in input_text:
        if char in characters:
            index = characters.index(char)
            if encrypt:
                result += characters[(index + key) % len(characters)]
            else:
                result += characters[(index - key) % len(characters)]
        else:
            result += char
    return result


def get_student_by_roll_no(roll_no):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute("SELECT * FROM students WHERE student_roll_no = %s LIMIT 1", (roll_no,))
            return cur.fetchone()
    finally:
        release_conn(conn)


def get_student_by_email(email):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute("SELECT * FROM students WHERE student_email = %s LIMIT 1", (email,))
            return cur.fetchone()
    finally:
        release_conn(conn)


def get_student_by_id(student_id):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute("SELECT * FROM students WHERE student_id = %s LIMIT 1", (student_id,))
            return cur.fetchone()
    finally:
        release_conn(conn)


def get_course_by_code_branch_semester(code, branch, semester):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """SELECT * FROM courses 
                   WHERE course_code = %s AND course_branch = %s AND course_semester = %s 
                   LIMIT 1""",
                (code, branch, semester)
            )
            return cur.fetchone()
    finally:
        release_conn(conn)
        
def get_course_by_name_branch_semester(name, branch, semester):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """SELECT * FROM courses 
                   WHERE course_name = %s AND course_branch = %s AND course_semester = %s 
                   LIMIT 1""",
                (name, branch, semester)
            )
            return cur.fetchone()
    finally:
        release_conn(conn)


def get_course_by_id(course_id):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute("SELECT * FROM courses WHERE course_id = %s LIMIT 1", (course_id,))
            return cur.fetchone()
    finally:
        release_conn(conn)


def get_test_by_id(test_id):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute("SELECT * FROM tests WHERE test_id = %s LIMIT 1", (test_id,))
            return cur.fetchone()
    finally:
        release_conn(conn)


def get_result_by_id(result_id):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute("SELECT * FROM results WHERE results_id = %s LIMIT 1", (result_id,))
            return cur.fetchone()
    finally:
        release_conn(conn)


# ---------------- Routes ----------------

@app.route('/')
def home():
    return render_template('home.html')


@app.route('/auth/sign-up', methods=["GET", "POST"])
def sign_up():
    session.clear()

    if request.method == "POST":
        input_name = request.form.get("input_name")
        input_email = request.form.get("input_email")
        input_password = request.form.get("input_password")
        input_roll_no = request.form.get("input_roll_no")
        input_semester = request.form.get("input_semester")
        input_dob = request.form.get("input_dob")
        input_branch = request.form.get("input_branch")
        input_phone = request.form.get("input_phone")
        input_gender = request.form.get("input_gender")

        if not all([input_email, input_password, input_gender, input_name,
                    input_roll_no, input_semester, input_dob, input_branch, input_phone]):
            flash("All fields are required!", "error")
            return redirect(url_for("sign_up"))

        if not re.match(EMAIL_REGEX, input_email):
            flash("Invalid email format!", "error")
            return redirect(url_for("sign_up"))

        if not re.match(PHONE_REGEX, input_phone):
            flash("Invalid phone format!", "error")
            return redirect(url_for("sign_up"))

        if get_student_by_email(input_email):
            flash("Email already exists!", "error")
            return redirect(url_for("sign_up"))

        if get_student_by_roll_no(input_roll_no):
            flash("Roll number already exists!", "error")
            return redirect(url_for("sign_up"))

        try:
            datetime.strptime(input_dob, "%Y-%m-%d")
        except ValueError:
            flash("Invalid date format for DOB! Use YYYY-MM-DD.", "error")
            return redirect(url_for("sign_up"))

        student_id = str(uuid.uuid4().hex)
        encrypted_password = ceaser_cipher(input_password, 16, True)

        conn = get_conn()
        try:
            with conn.cursor() as cur:
                cur.execute(
                    """INSERT INTO students 
                       (student_id, student_name, student_email, student_password,
                        student_roll_no, student_phone, student_gender, student_semester,
                        student_dob, student_branch, created_at)
                       VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                    (student_id, input_name, input_email, encrypted_password,
                     input_roll_no, input_phone, input_gender, input_semester,
                     input_dob, input_branch, datetime.now())
                )
            conn.commit()
        except Exception as e:
            conn.rollback()
            flash(f"Error creating account: {str(e)}", "error")
            return redirect(url_for("sign_up"))
        finally:
            release_conn(conn)

        return redirect(url_for("log_in"))

    return render_template('/auth/sign-up.html')


@app.route('/auth/log-in', methods=["GET", "POST"])
def log_in():
    session.clear()

    if request.method == "POST":
        input_roll_no = request.form.get("input_roll_no")
        input_password = request.form.get("input_password")
        input_password_encrypted = ceaser_cipher(input_password, 16, True)

        if not input_password or not input_roll_no:
            flash("All fields are required!", "error")
            return redirect(url_for("log_in"))

        conn = get_conn()
        try:
            with conn.cursor(cursor_factory=RealDictCursor) as cur:
                cur.execute(
                    """SELECT * FROM students 
                       WHERE student_password = %s AND student_roll_no = %s LIMIT 1""",
                    (input_password_encrypted, input_roll_no)
                )
                student = cur.fetchone()
        finally:
            release_conn(conn)

        if student:
            session["student_id"] = student["student_id"]
            session["student_name"] = student["student_name"]
            session["student_email"] = student["student_email"]
            session["student_password"] = student["student_password"]
            session["student_roll_no"] = student["student_roll_no"]
            session["student_phone"] = student["student_phone"]
            session["student_gender"] = student["student_gender"]
            session["student_semester"] = student["student_semester"]
            session["student_dob"] = student["student_dob"]
            session["student_branch"] = student["student_branch"]
            session["logged_in"] = True

            return redirect(url_for("home"))
        else:
            flash("Incorrect roll number or password!", "error")
            return redirect(url_for("log_in"))

    return render_template('/auth/log-in.html')


@app.route('/admin/auth/confirm', methods=["GET", "POST"])
def admin_confirm():
    session.clear()

    if request.method == "POST":
        password = request.form.get("password")
        admin = request.form.get("admin")

        if not password or not admin:
            flash("All fields are required!", "error")
            return redirect(url_for("admin_confirm"))

        if password == "17012005245166" and admin == "qarq90":
            return redirect(url_for("admin_log_in"))
        else:
            flash("Incorrect administrator and password!", "error")
            return redirect(url_for("admin_confirm"))

    return render_template('/admin/auth/confirm.html')


@app.route('/admin/auth/log-in', methods=["GET", "POST"])
def admin_log_in():
    session.clear()

    if request.method == "POST":
        course_name = request.form.get("course_name")
        course_branch = request.form.get("course_branch")
        course_semester = request.form.get("course_semester")

        if not all([course_name, course_semester, course_branch]):
            flash("All fields are required!", "error")
            return redirect(url_for("admin_log_in"))

        course = get_course_by_name_branch_semester(course_name, course_branch, course_semester)

        if course:
            session["course_code"] = course["course_code"]
            session["course_name"] = course["course_name"]
            session["course_branch"] = course["course_branch"]
            session["course_semester"] = course["course_semester"]
            session["course_id"] = course["course_id"]
            return redirect(url_for("create_test"))
        else:
            flash("Incorrect combination!", "error")
            return redirect(url_for("admin_log_in"))

    conn = get_conn()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT DISTINCT course_code FROM courses ORDER BY course_code")
            unique_codes = [row[0] for row in cur.fetchall()]
            
            cur.execute("SELECT DISTINCT course_name FROM courses ORDER BY course_name")
            unique_names = [row[0] for row in cur.fetchall()]

            cur.execute("SELECT DISTINCT course_branch FROM courses ORDER BY course_branch")
            unique_branches = [row[0] for row in cur.fetchall()]

            cur.execute("SELECT DISTINCT course_semester FROM courses ORDER BY course_semester")
            unique_semesters = [row[0] for row in cur.fetchall()]
    finally:
        release_conn(conn)

    return render_template(
        '/admin/auth/log-in.html',
        unique_codes=unique_codes,
        unique_names=unique_names,
        unique_branches=unique_branches,
        unique_semesters=unique_semesters
    )


@app.route('/admin/auth/sign-up', methods=["GET", "POST"])
def admin_sign_up():
    session.clear()

    if request.method == "POST":
        course_name = request.form.get("course_name")
        course_code = request.form.get("course_code")
        course_branch = request.form.get("course_branch")
        course_semester = request.form.get("course_semester")

        if not all([course_name, course_code, course_branch, course_semester]):
            flash("All fields are required!", "error")
            return redirect(url_for("admin_sign_up"))

        existing_course = get_course_by_code_branch_semester(course_code, course_branch, course_semester)
        if existing_course:
            flash("Course with this combination already exists!", "error")
            return redirect(url_for("admin_sign_up"))

        course_id = str(uuid.uuid4().hex)

        conn = get_conn()
        try:
            with conn.cursor() as cur:
                cur.execute(
                    """INSERT INTO courses 
                       (course_id, course_name, course_code, course_branch, course_semester, created_at)
                       VALUES (%s, %s, %s, %s, %s, %s)""",
                    (course_id, course_name, course_code, course_branch, course_semester, datetime.now())
                )
            conn.commit()
        except Exception as e:
            conn.rollback()
            flash(f"Error creating course: {str(e)}", "error")
            return redirect(url_for("admin_sign_up"))
        finally:
            release_conn(conn)

        return redirect(url_for("admin_log_in"))

    return render_template('/admin/auth/sign-up.html')


@app.route('/profile', methods=["GET", "POST"])
def profile():
    if 'student_id' not in session:
        flash("Please log in first", "error")
        return redirect(url_for('log_in'))

    if request.method == "POST":
        input_name = request.form.get("input_name")
        input_phone = request.form.get("input_phone")
        input_dob = request.form.get("input_dob")
        input_semester = request.form.get("input_semester")
        input_gender = request.form.get("input_gender")

        if not all([input_name, input_phone, input_dob, input_semester, input_gender]):
            flash("All fields are required!", "error")
            return redirect(url_for("profile"))

        if not re.match(PHONE_REGEX, input_phone):
            flash("Invalid phone number! Must be 10-15 digits without country code.", "error")
            return redirect(url_for("profile"))

        try:
            datetime.strptime(input_dob, "%Y-%m-%d")
        except ValueError:
            flash("Invalid date format! Use YYYY-MM-DD.", "error")
            return redirect(url_for("profile"))

        conn = get_conn()
        try:
            with conn.cursor() as cur:
                cur.execute(
                    """UPDATE students 
                       SET student_name = %s, student_phone = %s, student_dob = %s,
                           student_gender = %s, student_semester = %s
                       WHERE student_id = %s""",
                    (input_name, input_phone, input_dob, input_gender, input_semester, session['student_id'])
                )
            conn.commit()

            session['student_name'] = input_name
            session['student_phone'] = input_phone
            session['student_dob'] = input_dob
            session['student_gender'] = input_gender
            session['student_semester'] = input_semester

            flash("Profile updated successfully!", "success")
        except Exception as e:
            conn.rollback()
            flash(f"Error updating profile: {str(e)}", "error")
        finally:
            release_conn(conn)

        return redirect(url_for("profile"))

    return render_template('profile.html')


@app.route('/leaderboards')
def leaderboard():
    if 'student_branch' not in session or 'student_semester' not in session:
        flash("You need to log in first!", "error")
        return redirect(url_for("log_in"))

    branch = session.get("student_branch") or session.get("course_branch")
    semester = session.get("student_semester") or session.get("course_semester")

    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """SELECT s.student_name,
                          r.roll_no AS student_roll_no,
                          SUM(r.score) AS total_score
                   FROM results r
                   JOIN students s ON s.student_roll_no = r.roll_no
                   WHERE r.course_branch = %s AND r.course_semester = %s
                   GROUP BY r.roll_no, s.student_name
                   ORDER BY total_score DESC
                   LIMIT 3""",
                (branch, semester)
            )
            top_students = cur.fetchall()
    finally:
        release_conn(conn)

    if not top_students:
        flash("No leaderboard data available yet.", "info")

    return render_template('leaderboards.html', top_students=top_students)


@app.route('/tests/lectures')
def lectures():
    query = "SELECT * FROM tests"
    params = []
    
    print(session)

    if "course_branch" in session and "course_semester" in session:
        query += " WHERE course_branch = %s AND course_semester = %s"
        params = [session["course_branch"], session["course_semester"]]
    elif "student_branch" in session and "student_semester" in session:
        query += " WHERE course_branch = %s AND course_semester = %s"
        params = [session["student_branch"], session["student_semester"]]

    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(query, params)
            lectures = cur.fetchall()
    finally:
        release_conn(conn)

    return render_template('/tests/lectures.html', lectures=lectures)


@app.route('/tests/start-test/<test_id>', methods=["GET", "POST"])
def start_test(test_id):
    test = get_test_by_id(test_id)

    if not test:
        flash("Test not found!", "error")
        return redirect(url_for("lectures"))

    questions = test.get("questions", [])

    if isinstance(questions, str):
        questions = json.loads(questions)

    if request.method == "POST":
        score = 0
        total_questions = len(questions)
        user_answers = []

        for i, question in enumerate(questions, start=1):
            selected_answer = request.form.get(f"question_{i}")
            correct_answer = question.get('correct_answer', '').lower()
            is_correct = False

            if selected_answer and selected_answer.lower() == correct_answer:
                score += 1
                is_correct = True

            user_answers.append({
                "question_text": question.get('question', ''),
                "option_a": question.get('options_a', ''),
                "option_b": question.get('options_b', ''),
                "option_c": question.get('options_c', ''),
                "option_d": question.get('options_d', ''),
                "correct_option": correct_answer,
                "selected_answer": selected_answer,
                "is_correct": is_correct
            })

        current_date = datetime.now().strftime("%d/%m/%Y")
        results_id = str(uuid.uuid4().hex)

        conn = get_conn()
        try:
            with conn.cursor() as cur:
                cur.execute(
                    """INSERT INTO results 
                       (results_id, course_name, course_code, course_semester, course_branch,
                        test_name, roll_no, score, total_questions, result,
                        user_answers, submission_date, submitted_at)
                       VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                    (results_id,
                     test.get("course_name"),
                     test.get("course_code"),
                     test.get("course_semester"),
                     session.get("student_branch"),
                     test.get("test_name"),
                     session.get("student_roll_no"),
                     score,
                     total_questions,
                     f"{score}/{total_questions}",
                     Json(user_answers),
                     current_date,
                     datetime.now())
                )
            conn.commit()
        except Exception as e:
            conn.rollback()
            flash(f"Error saving result: {str(e)}", "error")
            return redirect(url_for("lectures"))
        finally:
            release_conn(conn)

        flash("Test submitted successfully!", "success")
        return redirect(url_for("view_results", test_id=test_id, result_id=results_id))

    return render_template('/tests/start-test.html', test=test, questions=questions)


@app.route('/tests/view-results/<test_id>/<result_id>', methods=["GET", "POST"])
def view_results(test_id, result_id):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """SELECT * FROM results 
                   WHERE roll_no = %s AND results_id = %s""",
                (session["student_roll_no"], result_id)
            )
            user_results = cur.fetchall()
    finally:
        release_conn(conn)

    test = get_test_by_id(test_id)
    results = []

    for result in user_results:
        user_answers = result.get("user_answers", [])
        if isinstance(user_answers, str):
            try:
                user_answers = json.loads(user_answers)
            except json.JSONDecodeError:
                user_answers = []

        result_dict = {
            "id": result["results_id"],
            "course_name": result.get("course_name"),
            "course_code": result.get("course_code"),
            "course_semester": result.get("course_semester"),
            "course_branch": result.get("course_branch"),
            "test_name": result.get("test_name"),
            "roll_no": result.get("roll_no"),
            "score": result.get("score"),
            "total_questions": result.get("total_questions"),
            "result": result.get("result"),
            "user_answers": user_answers
        }
        results.append(result_dict)

    return render_template('/tests/view-results.html', results=results, test=test)


@app.route('/admin/create/create-test', methods=["GET", "POST"])
def create_test():
    if request.method == "POST":
        test_name = request.form.get("test_name")
        test_description = request.form.get("test_description")
        test_duration = request.form.get("test_duration")

        if 'questions_json' not in request.files:
            flash("No JSON file uploaded!", "error")
            return redirect(url_for("create_test"))

        json_file = request.files['questions_json']

        if json_file.filename == '':
            flash("No file selected!", "error")
            return redirect(url_for("create_test"))

        try:
            questions_data = json.load(json_file)
        except json.JSONDecodeError:
            flash("Invalid JSON file!", "error")
            return redirect(url_for("create_test"))

        if "questions" not in questions_data:
            flash("Invalid JSON structure: Missing 'questions' field!", "error")
            return redirect(url_for("create_test"))

        test_id = str(uuid.uuid4().hex)

        conn = get_conn()
        try:
            with conn.cursor() as cur:
                cur.execute(
                    """INSERT INTO tests 
                       (test_id, test_name, test_description, course_name, course_code,
                        course_semester, course_branch, questions, created_at, test_duration, created_timestamp)
                       VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                    (test_id,
                     test_name,
                     test_description,
                     session.get("course_name"),
                     session.get("course_code"),
                     session.get("course_semester"),
                     session.get("course_branch"),
                     Json(questions_data["questions"]),
                     datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                     test_duration,
                     datetime.now())
                )
            conn.commit()
        except Exception as e:
            conn.rollback()
            flash(f"Error creating test: {str(e)}", "error")
            return redirect(url_for("create_test"))
        finally:
            release_conn(conn)

        flash("Test created successfully!", "success")
        return redirect(url_for("create_test"))

    return render_template('/admin/create/create-test.html')


@app.route('/delete_test/<test_id>', methods=['DELETE'])
def delete_test(test_id):
    conn = get_conn()
    try:
        with conn.cursor() as cur:
            # Delete associated results first (if not using FK cascade)
            cur.execute("DELETE FROM results WHERE test_name = %s", (test_id,))
            # Then delete the test
            cur.execute("DELETE FROM tests WHERE test_id = %s", (test_id,))
        conn.commit()
    except Exception as e:
        conn.rollback()
        return {"error": str(e)}, 500
    finally:
        release_conn(conn)

    return {"redirect": url_for('lectures')}, 200


@app.route('/materials')
def view_materials():
    if 'student_branch' not in session or 'student_semester' not in session:
        flash("Please log in first", "error")
        return redirect(url_for('log_in'))

    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            # Get courses for the student's branch and semester
            cur.execute(
                """SELECT * FROM courses 
                   WHERE course_branch = %s AND course_semester = %s""",
                (session['student_branch'], session['student_semester'])
            )
            courses = cur.fetchall()

            course_ids = [course['course_id'] for course in courses]

            if not course_ids:
                return render_template('materials.html', materials=[])

            # Get materials for those courses
            cur.execute(
                """SELECT m.*, c.course_name 
                   FROM course_materials m
                   JOIN courses c ON c.course_id = m.course_id
                   WHERE m.course_id = ANY(%s)
                   ORDER BY m.created_at DESC""",
                (course_ids,)
            )
            materials = cur.fetchall()
    finally:
        release_conn(conn)

    return render_template('materials.html', materials=materials)


@app.route('/admin/materials', methods=['GET', 'POST'])
def manage_materials():
    if 'course_id' not in session:
        flash("Admin login required", "error")
        return redirect(url_for('admin_log_in'))

    if request.method == 'POST':
        try:
            course_id = request.form.get('course_id')
            material_type = request.form.get('material_type')
            title = request.form.get('title')
            url = request.form.get('url')

            if not all([course_id, material_type, title, url]):
                flash("All fields are required", "error")
                return redirect(url_for('manage_materials'))

            if not url.startswith(('http://', 'https://')):
                flash("Invalid URL format - must start with http:// or https://", "error")
                return redirect(url_for('manage_materials'))

            if not get_course_by_id(course_id):
                flash("Invalid course selection", "error")
                return redirect(url_for('manage_materials'))

            material_id = str(uuid.uuid4())

            conn = get_conn()
            try:
                with conn.cursor() as cur:
                    cur.execute(
                        """INSERT INTO course_materials 
                           (material_id, course_id, material_type, title, url, created_at)
                           VALUES (%s, %s, %s, %s, %s, %s)""",
                        (material_id, course_id, material_type, title, url, datetime.now())
                    )
                conn.commit()
            except Exception as e:
                conn.rollback()
                flash(f"Error: {str(e)}", "error")
                return redirect(url_for('manage_materials'))
            finally:
                release_conn(conn)

            flash("Material added successfully!", "success")
            return redirect(url_for('manage_materials'))

        except Exception as e:
            flash(f"Error: {str(e)}", "error")
            return redirect(url_for('manage_materials'))

    try:
        conn = get_conn()
        try:
            with conn.cursor(cursor_factory=RealDictCursor) as cur:
                cur.execute("SELECT course_id, course_name FROM courses")
                courses = cur.fetchall()

                cur.execute(
                    """SELECT m.*, c.course_name 
                       FROM course_materials m
                       LEFT JOIN courses c ON c.course_id = m.course_id
                       ORDER BY m.created_at DESC"""
                )
                materials = cur.fetchall()
        finally:
            release_conn(conn)

        return render_template('admin/materials.html',
                               courses=courses,
                               materials=materials)

    except Exception as e:
        flash(f"Error loading materials: {str(e)}", "error")
        return redirect(url_for('manage_materials'))


@app.route('/admin/materials/<material_id>', methods=['DELETE'])
def delete_material(material_id):
    try:
        if 'course_id' not in session:
            return jsonify({"error": "Unauthorized"}), 401

        conn = get_conn()
        try:
            with conn.cursor() as cur:
                cur.execute("DELETE FROM course_materials WHERE material_id = %s", (material_id,))
                deleted = cur.rowcount
            conn.commit()
        finally:
            release_conn(conn)

        if deleted == 0:
            return jsonify({"error": "Material not found"}), 404

        return jsonify({"message": "Material deleted successfully"}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True)