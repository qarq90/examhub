from flask import Flask, render_template, request, redirect, session, url_for, flash, get_flashed_messages
from datetime import datetime
import sqlite3
import json
import uuid
import re

EMAIL_REGEX = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
PHONE_REGEX = r"^[1-9][0-9]{9,14}$"

app = Flask(__name__)
app.secret_key = "17012005245166"

conn = sqlite3.connect("examhub.db", check_same_thread=False)
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE IF NOT EXISTS students (
    student_id TEXT,
    student_name TEXT,
    student_email TEXT,
    student_password TEXT,
    student_roll_no TEXT,
    student_phone TEXT,
    student_gender TEXT,
    student_semester TEXT,
    student_dob TEXT,
    student_branch TEXT
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS courses (
    course_id TEXT,
    course_name TEXT,
    course_code TEXT,
    course_branch TEXT,
    course_semester TEXT
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS tests (
    test_id TEXT,
    test_name TEXT,
    test_description TEXT,
    course_name TEXT,
    course_code TEXT,
    course_semester TEXT,
    course_branch TEXT,
    questions TEXT,  -- Storing questions as JSON string
    created_at TEXT
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS results (
    results_id TEXT,
    course_name TEXT,
    course_code TEXT,
    course_semester TEXT,
    course_branch TEXT,
    test_name TEXT,
    roll_no TEXT,
    score INTEGER,
    total_questions INTEGER,
    result TEXT,
    user_answers TEXT  -- Storing user answers as JSON string
)
''')

conn.commit()

def ceaser_cipher(input, key, type):
    characters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K","M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "/", "+", " "]
    base64 = ""
    for char in input:
        if(type == True):
            base64 += characters[(characters.index(char) + key) % len(characters)]
        else: 
            base64 += characters[(characters.index(char) - key) % len(characters)]
    
    return base64

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

        if not input_email or not input_password or not input_gender or not input_name or not input_roll_no or not input_semester or not input_dob or not input_branch or not input_phone:
            flash("All fields are required!", "error")
            return redirect(url_for("sign_up"))

        if not re.match(EMAIL_REGEX, input_email):
            flash("Invalid email format!", "error")
            return redirect(url_for("sign_up"))
        
        if not re.match(PHONE_REGEX, input_phone):
            flash("Invalid phone format!", "error")
            return redirect(url_for("sign_up"))

        cursor.execute("SELECT * FROM students WHERE student_email = ?", (input_email,))
        if cursor.fetchone():
            flash("Email already exists!", "error")
            return redirect(url_for("sign_up"))

        try:
            input_dob_date = datetime.strptime(input_dob, "%Y-%m-%d")  
        except ValueError:
            flash("Invalid date format for DOB! Use YYYY-MM-DD.", "error")
            return redirect(url_for("sign_up"))

        student_data = (str(uuid.uuid4().hex), input_name, input_email, ceaser_cipher(input_password, 16, True), input_roll_no, input_phone,input_gender, input_semester, input_dob, input_branch)
        cursor.execute(
                """
                    INSERT INTO students 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """,
                student_data
            )
        conn.commit()

        return redirect(url_for("log_in"))

    return render_template('/auth/sign-up.html')

@app.route('/auth/log-in', methods=["GET", "POST"])
def log_in():
    session.clear()
    if request.method == "POST":
        input_roll_no = request.form.get("input_roll_no")
        input_password = request.form.get("input_password")
        input_password = ceaser_cipher(input_password, 16, True)

        if not input_password or not input_roll_no:
            flash("All fields are required!", "error")
            return redirect(url_for("log_in"))

        cursor.execute("SELECT * FROM students WHERE student_password = ? AND student_roll_no = ?", (input_password, input_roll_no))
        student = cursor.fetchone()

        if student:
            session["student_id"] = student[0]  
            session["student_name"] = student[1]
            session["student_email"] = student[2]
            session["student_password"] = student[3]
            session["student_roll_no"] = student[4]
            session["student_phone"] = student[5]
            session["student_gender"] = student[6]
            session["student_semester"] = student[7]
            session["student_dob"] = student[8]
            session["student_branch"] = student[9]
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
        course_code = request.form.get("course_code")
        course_branch = request.form.get("course_branch")
        course_semester = request.form.get("course_semester")

        if not course_code or not course_semester or not course_branch:
            flash("All fields are required!", "error")
            return redirect(url_for("admin_log_in"))
        
        cursor.execute("SELECT * FROM courses WHERE course_code = ? AND course_branch = ? AND course_semester = ?", (course_code, course_branch, course_semester))
        course = cursor.fetchone()

        if course:
            session["course_code"] = course[2]
            session["course_name"] = course[1]
            session["course_branch"] = course[3]
            session["course_semester"] = course[4]
            session["course_id"] = course[0]
            return redirect(url_for("create_test"))
        
        else:
            flash("Incorrect combination!", "error")
            return redirect(url_for("admin_log_in"))
    
    cursor.execute("SELECT DISTINCT course_code FROM courses")
    unique_codes = [row[0] for row in cursor.fetchall()]
    cursor.execute("SELECT DISTINCT course_branch FROM courses")
    unique_branches = [row[0] for row in cursor.fetchall()]
    cursor.execute("SELECT DISTINCT course_semester FROM courses")
    unique_semesters = [row[0] for row in cursor.fetchall()]

    return render_template(
        '/admin/auth/log-in.html',
        unique_codes=unique_codes,
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

        if not course_name or not course_code or not course_branch or not course_semester:
            flash("All fields are required!", "error")
            return redirect(url_for("admin_sign_up"))
    
        course_data = (str(uuid.uuid4().hex), course_name, course_code, course_branch, course_semester)
        cursor.execute(
                """
                    INSERT INTO courses
                    VALUES (?, ?, ?, ?, ?)
                """, 
                course_data
            )
        conn.commit()

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

        try:
            cursor.execute("""
                UPDATE students SET 
                student_name = ?,
                student_phone = ?,
                student_dob = ?,
                student_gender = ?,
                student_semester = ?
                WHERE student_id = ?
            """, (input_name, input_phone, input_dob, input_gender, input_semester, session['student_id']))
            
            conn.commit()
            
            session['student_name'] = input_name
            session['student_phone'] = input_phone
            session['student_dob'] = input_dob
            session['student_gender'] = input_gender
            session['student_semester'] = input_semester
            
            flash("Profile updated successfully!", "success")
        except Exception as e:
            flash(f"Error updating profile: {str(e)}", "error")

        return redirect(url_for("profile"))
    
    return render_template('profile.html')

@app.route('/leaderboards')
def leaderboard():
    if 'student_branch' not in session or 'student_semester' not in session: 
        flash("You need to log in first!", "error")
        return redirect(url_for("log_in"))

    branch = session.get("branch")
    year = session.get("year") 

    cursor.execute("""
        SELECT students.student_name, results.roll_no, SUM(results.score) as total_score
        FROM results
        JOIN students ON results.roll_no = students.student_roll_no
        WHERE results.course_branch = ? AND results.course_semester = ?
        GROUP BY students.student_name, results.roll_no
        HAVING total_score > 0
        ORDER BY total_score DESC
        LIMIT 3
    """, (branch, year))

    top_students = cursor.fetchall()

    if not top_students:
        flash("No leaderboard data available yet.", "info")

    return render_template('leaderboards.html', top_students=top_students)

@app.route('/tests/lectures')
def lectures():
    if "course_branch" in session:
        cursor.execute("SELECT * FROM tests WHERE course_branch = ? AND course_semester = ?", (session["course_branch"], session["course_semester"]))
    elif "student_branch" in session:
        cursor.execute("SELECT * FROM tests WHERE course_branch = ? AND course_semester = ?", (session["student_branch"], session["student_semester"]))

    lectures = cursor.fetchall()

    return render_template('/tests/lectures.html', lectures=lectures)

@app.route('/tests/start-test/<test_id>', methods=["GET", "POST"])
def start_test(test_id):
    
    cursor.execute("SELECT * FROM tests WHERE test_id = ?", (test_id,))
    test = cursor.fetchone()

    if not test:
        flash("Test not found!", "error")
        return redirect(url_for("lectures"))
    
    questions = json.loads(test[7])  

    if request.method == "POST":
        score = 0
        total_questions = len(questions['questions'])
        user_answers = []  
        
        for i, question in enumerate(questions, start=1):
            selected_answer = request.form.get(f"question_{i}")  
            correct_answer = question['correct_answer'].lower() 
            is_correct = False
            
            if selected_answer and selected_answer.lower() == correct_answer:
                score += 1
                is_correct = True
            
            user_answers.append({
                "question_text": question['question_text'],
                "option_a": question['option_a'],
                "option_b": question['option_b'],
                "option_c": question['option_c'],
                "option_d": question['option_d'],
                "correct_option": correct_answer,
                "selected_answer": selected_answer,
                "is_correct": is_correct
            })
        
        result_data = (
          str(uuid.uuid4().hex),
            test[1],    
            test[2],  
            test[3],  
            test[4],  
            test[5],  
            session["roll_no"],  
            score,  
            total_questions,  
            f"{score}/{total_questions}",  
            json.dumps(user_answers)  
        )

        cursor.execute(
                """
                    INSERT INTO results VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """, 
                result_data
            )

        result_id = cursor.lastrowid
        conn.commit()

        flash("Test submitted successfully!", "success")
        return redirect(url_for("view_results",test_id=result_id))
    
    return render_template('/tests/start-test.html', test=test, questions=questions)

@app.route('/tests/view-results/<test_id>', methods=["GET", "POST"])
def view_results(test_id):
    cursor.execute("SELECT * FROM results WHERE roll_no = ? AND results_id = ?", (session["roll_no"], test_id))
    user_results = cursor.fetchall()

    results = []
    for result in user_results:

        try:
            user_answers = json.loads(result[10])
        except json.JSONDecodeError as e:
            print("Error parsing user_answers JSON:", e)
            user_answers = []  

        result_dict = {
            "id": result[0],
            "course_name": result[1],
            "course_code": result[2],
            "course_semester": result[3],
            "course_branch": result[4],
            "test_name": result[5],
            "roll_no": result[6],
            "score": result[7],
            "total_questions": result[8],
            "result": result[9],
            "user_answers": user_answers  
        }
        results.append(result_dict)

    return render_template('/tests/view-results.html', results=results)

@app.route('/admin/create/create-test', methods=["GET", "POST"])
def create_test():
    if request.method == "POST":
        test_name = request.form.get("test_name")
        test_description = request.form.get("test_description")

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

        test_data = (
            str(uuid.uuid4().hex),
            test_name,
            test_description,
            session.get("course_name"),
            session.get("course_code"),
            session.get("course_semester"),
            session.get("course_branch"),
            json.dumps(questions_data["questions"]),
            datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )

        cursor.execute("INSERT INTO tests VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", test_data)
        conn.commit()

        flash("Test created successfully!", "success")
        return redirect(url_for("create_test"))

    return render_template('/admin/create/create-test.html')

@app.route('/delete_test/<test_id>', methods=['DELETE'])
def delete_test(test_id):
    cursor.execute("DELETE FROM tests WHERE test_id = ?", (test_id,))
    cursor.execute("DELETE FROM results WHERE test_name IN (SELECT test_name FROM tests WHERE test_id = ?)", (test_id,))
    conn.commit()
    return {"redirect": url_for('lectures')}, 200

if __name__ == '__main__':
    app.run(debug=True)