from flask import Flask, render_template, request, redirect, session, url_for, flash, get_flashed_messages
from pymongo import MongoClient
from bson import ObjectId
from datetime import datetime
import json
import re

EMAIL_REGEX = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"

app = Flask(__name__)
app.secret_key = "17012005245166"

client = MongoClient("mongodb+srv://admin:FV08jMOzSNBz1eVf@cluster0.vrpea8c.mongodb.net/?retryWrites=true&w=majority")  

db = client["examhub"]

students = db["students"]
courses = db["courses"]
tests = db["tests"]
results = db["results"]

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

        if students.find_one({"email": email}):
            flash("Email already exists!", "error")
            return redirect(url_for("sign_up"))

        try:
            dob_date = datetime.strptime(dob, "%Y-%m-%d")  
        except ValueError:
            flash("Invalid date format for DOB! Use YYYY-MM-DD.", "error")
            return redirect(url_for("/sign_up"))

        student_data = {
            "name": name,
            "email": email,
            "password": ceaser_cipher(password, 16, True),  
            "roll_no": roll_no,
            "year": year,
            "dob": dob,  
            "branch": branch,  
        }

        students.insert_one(student_data)

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

        student = students.find_one({"password": password, "roll_no": roll_no})

        if student:
            session["student_id"] = str(student["_id"])  
            session["roll_no"] = student.get("roll_no")
            session["name"] = student.get("name")
            session["year"] = student.get("year")
            session["dob"] = student.get("dob")
            session["branch"] = student.get("branch")
            session["phone"] = student.get("phone")
            session["email"] = student.get("email")
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
        
        course = courses.find_one({"course_code": course_code, "course_semester": course_semester, "course_branch": course_branch})
        
        if course:
            session["course_code"] = course_code
            session["course_name"] = course.get("course_name")
            session["course_branch"] = course.get("course_branch")
            session["course_semester"] = course.get("course_semester")
            session["course_id"] = str(course["_id"])
            return redirect(url_for("create_test"))
        
        else:
            flash("Incorrect combination!", "error")
            return redirect(url_for("admin_log_in"))
    
    all_courses = list(courses.find({}))

    unique_codes = set(course["course_code"] for course in all_courses)
    unique_branches = set(course["course_branch"] for course in all_courses)
    unique_semesters = set(course["course_semester"] for course in all_courses)

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
    
        course_data = {
            "course_name": course_name,
            "course_code": course_code,
            "course_branch": course_branch,
            "course_semester": course_semester,
        }

        courses.insert_one(course_data)
        return redirect(url_for("admin_log_in"))

    return render_template('/admin/auth/sign-up.html')

@app.route('/profile')
def profile():
    return render_template('profile.html')

@app.route('/tests/lectures')
def lectures():
    lectures = list(tests.find())  

    for lecture in lectures:
        lecture['_id'] = str(lecture['_id'])  

    return render_template('/tests/lectures.html', lectures=lectures)

@app.route('/tests/start-test/<test_id>', methods=["GET", "POST"])
def start_test(test_id):
    test = tests.find_one({"_id": ObjectId(test_id)})
    
    if not test:
        flash("Test not found!", "error")
        return redirect(url_for("lectures"))

    if request.method == "POST":
        score = 0
        total_questions = len(test['questions'])
        user_answers = []  # To store the user's answers and question details
        
        for i, question in enumerate(test['questions'], start=1):
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

        result_data = {
            "course_name": test['course_name'],
            "course_code": test['course_code'],
            "course_semester": test['course_semester'],
            "course_branch": test['course_branch'],
            "test_name": test['test_name'],
            "roll_no": session["roll_no"],
            "score": score,  
            "total_questions": total_questions,  
            "result": f"{score}/{total_questions}",
            "user_answers": user_answers 
        }
        results.insert_one(result_data)

        flash("Test submitted successfully!", "success")
        return redirect(url_for("view_results")) 

    return render_template('/tests/start-test.html', test=test)

@app.route('/view-results')
def view_results():
    user_results = results.find({"roll_no": session["roll_no"]})  
    return render_template('/tests/view-results.html', results=user_results)

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

        test_data = {
            "course_name": session.get("course_name"),
            "course_code": session.get("course_code"),
            "course_semester": session.get("course_semester"),
            "course_branch": session.get("course_branch"),
            "test_name": test_name,
            "test_description": test_description,
            "questions": questions_data["questions"], 
            "created_at": datetime.now(),
        }

        tests.insert_one(test_data)

        flash("Test created successfully!", "success")
        return redirect(url_for("create_test"))

    return render_template('/admin/create/create-test.html')

if __name__ == '__main__':
    app.run(debug=True)