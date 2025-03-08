from flask import Flask, render_template, request, redirect, session, url_for, flash, get_flashed_messages
from pymongo import MongoClient
from datetime import datetime
import re

EMAIL_REGEX = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"

app = Flask(__name__)
app.secret_key = "17012005245166"

client = MongoClient("mongodb+srv://admin:FV08jMOzSNBz1eVf@cluster0.vrpea8c.mongodb.net/?retryWrites=true&w=majority")  

db = client["examhub"]

students = db["students"]
courses = db["courses"]

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
        course_token = request.form.get("course_token")

        if not course_code or not course_token:
            flash("All fields are required!", "error")
            return redirect(url_for("admin_log_in"))
        
        course = courses.find_one({"course_code": course_code, "course_token": course_token})
        
        if course:
            return redirect(url_for("create_test"))
        
        else:
            flash("Incorrect course code or token!", "error")
            return redirect(url_for("admin_log_in"))
        
    return render_template('/admin/auth/log-in.html')

@app.route('/admin/auth/sign-up', methods=["GET", "POST"])
def admin_sign_up():
    
    session.clear()

    if request.method == "POST":
        course_name = request.form.get("course_name")
        course_code = request.form.get("course_code")
        course_token = request.form.get("course_token")
        course_branch = request.form.get("course_branch")
        course_semester = request.form.get("course_semester")

        if not course_name or not course_code or not course_token or not course_branch or not course_semester:
            flash("All fields are required!", "error")
            return redirect(url_for("admin_sign_up"))
    
        course_data = {
            "course_name": course_name,
            "course_code": course_code,
            "course_token": course_token,
            "course_branch": course_branch,
            "course_semester": course_semester,
        }

        courses.insert_one(course_data)
        return redirect(url_for("home"))

    return render_template('/admin/auth/sign-up.html')

@app.route('/profile')
def profile():
    return render_template('profile.html')

@app.route('/admin/create/create-test')
def create_test():
    return render_template('/admin/create/create-test.html')

# Define a route for an API endpoint
@app.route('/api/data')
def get_data():
   return render_template('/templates/index.html')

if __name__ == '__main__':
    app.run(debug=True)