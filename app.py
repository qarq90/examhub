from flask import Flask, render_template, request, redirect, session, url_for, flash, get_flashed_messages
from datetime import datetime
import sqlite3
import json
import uuid
import re

EMAIL_REGEX = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"

app = Flask(__name__)
app.secret_key = "17012005245166"

conn = sqlite3.connect("examhub.db", check_same_thread=False)
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE IF NOT EXISTS students (
    id TEXT PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT,
    roll_no TEXT,
    year TEXT,
    dob TEXT,
    branch TEXT
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS courses (
    id TEXT PRIMARY KEY,
    course_name TEXT,
    course_code TEXT,
    course_branch TEXT,
    course_semester TEXT
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS tests (
    id TEXT PRIMARY KEY,
    course_name TEXT,
    course_code TEXT,
    course_semester TEXT,
    course_branch TEXT,
    test_name TEXT,
    test_description TEXT,
    questions TEXT,  -- Storing questions as JSON string
    created_at TEXT
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS results (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
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
        name = request.form.get("name")
        email = request.form.get("email")
        password = request.form.get("password")
        roll_no = request.form.get("roll_no")
        year = request.form.get("year")
        dob = request.form.get("dob")  
        branch = request.form.get("branch")  

        if not email or not password or not roll_no or not year or not dob or not branch:
            flash("All fields are required!", "error")
            return redirect(url_for("sign_up"))

        if not re.match(EMAIL_REGEX, email):
            flash("Invalid email format!", "error")
            return redirect(url_for("sign_up"))

        cursor.execute("SELECT * FROM students WHERE email = ?", (email,))
        if cursor.fetchone():
            flash("Email already exists!", "error")
            return redirect(url_for("sign_up"))

        try:
            dob_date = datetime.strptime(dob, "%Y-%m-%d")  
        except ValueError:
            flash("Invalid date format for DOB! Use YYYY-MM-DD.", "error")
            return redirect(url_for("sign_up"))

        student_data = (str(uuid.uuid4().hex), name, email, ceaser_cipher(password, 16, True), roll_no, year, dob, branch)
        cursor.execute("INSERT INTO students VALUES (?, ?, ?, ?, ?, ?, ?, ?)", student_data)
        conn.commit()

        return redirect(url_for("log_in"))

    return render_template('/auth/sign-up.html')

@app.route('/auth/log-in', methods=["GET", "POST"])
def log_in():
    session.clear()

    if request.method == "POST":
        password = request.form.get("password")
        roll_no = request.form.get("roll_no")
        password = ceaser_cipher(password, 16, True)

        if not password or not roll_no:
            flash("All fields are required!", "error")
            return redirect(url_for("log_in"))

        cursor.execute("SELECT * FROM students WHERE password = ? AND roll_no = ?", (password, roll_no))
        student = cursor.fetchone()

        if student:
            session["student_id"] = student[0]  
            session["roll_no"] = student[4]
            session["name"] = student[1]
            session["year"] = student[5]
            session["dob"] = student[6]
            session["branch"] = student[7]
            session["email"] = student[2]
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
        cursor.execute("INSERT INTO courses VALUES (?, ?, ?, ?, ?)", course_data)
        conn.commit()

        return redirect(url_for("admin_log_in"))

    return render_template('/admin/auth/sign-up.html')

@app.route('/profile')
def profile():
    return render_template('profile.html')

@app.route('/leaderboards')
def leaderboards():
    return render_template('leaderboards.html')

@app.route('/tests/lectures')
def lectures():
    if 'branch' not in session and 'course_branch' not in session:
        flash("You need to login first!", "error")
        return redirect(url_for("log_in"))

    if "course_branch" in session:
        cursor.execute("SELECT * FROM tests WHERE course_branch = ?", (session["course_branch"],))
    elif "branch" in session:
        cursor.execute("SELECT * FROM tests WHERE course_branch = ?", (session["branch"],))
    else:
        return None  # Or return an empty list/appropriate response

    lectures = cursor.fetchall()

    for lecture in lectures:
        lecture = list(lecture)
        lecture[0] = str(lecture[0])

    return render_template('/tests/lectures.html', lectures=lectures)

@app.route('/tests/start-test/<test_id>', methods=["GET", "POST"])
def start_test(test_id):
    
    cursor.execute("SELECT * FROM tests WHERE id = ?", (test_id,))
    test = cursor.fetchone()

    if not test:
        flash("Test not found!", "error")
        return redirect(url_for("lectures"))
    
    questions = json.loads(test[7])  

    if request.method == "POST":
        score = 0
        total_questions = len(questions)
        user_answers = []  
        
        for i, question in enumerate(questions, start=1):
            selected_answer = request.form.get(f"question_{i}")  
            correct_answer = question['correct_option'].lower()  
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

        cursor.execute("""
            INSERT INTO results (course_name, course_code, course_semester, course_branch, test_name, roll_no, score, total_questions, result, user_answers)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, result_data)

        result_id = cursor.lastrowid
        conn.commit()

        flash("Test submitted successfully!", "success")
        return redirect(url_for("view_results",test_id=result_id))
    
    return render_template('/tests/start-test.html', test=test, questions=questions)

@app.route('/tests/view-results/<test_id>', methods=["GET", "POST"])
def view_results(test_id):
    print(test_id)
    cursor.execute("SELECT * FROM results WHERE roll_no = ? AND id = ?", (session["roll_no"], test_id))
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
            session.get("course_name"),
            session.get("course_code"),
            session.get("course_semester"),
            session.get("course_branch"),
            test_name,
            test_description,
            json.dumps(questions_data["questions"]),
            datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )

        cursor.execute("INSERT INTO tests VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", test_data)
        conn.commit()

        flash("Test created successfully!", "success")
        return redirect(url_for("create_test"))

    return render_template('/admin/create/create-test.html')

if __name__ == '__main__':
    app.run(debug=True)