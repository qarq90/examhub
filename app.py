from flask import Flask, render_template, request, redirect, url_for, flash, get_flashed_messages
from pymongo import MongoClient
import re

EMAIL_REGEX = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"

app = Flask(__name__)
app.secret_key = "17012005245166"

client = MongoClient("mongodb+srv://admin:FV08jMOzSNBz1eVf@cluster0.vrpea8c.mongodb.net/?retryWrites=true&w=majority")  
db = client["examhub"]
users = db["users"]

@app.route('/')
def home():
    return render_template('home.html',hide_nav_footer=False)

@app.route('/auth/sign-up', methods=["GET", "POST"])
def sign_up():
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        password = request.form.get("password")
        roll_no = request.form.get("roll_no")
        year = request.form.get("year")

        if not email or not password or not roll_no or not year:
            flash("All fields are required!", "error")
            return redirect(url_for("sign_up"))

        if not re.match(EMAIL_REGEX, email):
            flash("Invalid email format!", "error")
            return redirect(url_for("sign_up"))

        if users.find_one({"email": email}):
            flash("Email already exists!", "error")
            return redirect(url_for("sign_up"))

        user_data = {
            "name": name,
            "email": email,
            "password": password,  
            "roll_no": roll_no,
            "year": year,
        }
        users.insert_one(user_data)

        return redirect(url_for("log_in"))

    return render_template('/auth/sign-up.html', hide_nav_footer=True)

@app.route('/auth/log-in', methods=["GET", "POST"])
def log_in():
    if request.method == "POST":
        name = request.form.get("name")
        roll_no = request.form.get("roll_no")

        if not name or not roll_no:
            flash("All fields are required!", "error")
            return redirect(url_for("log_in"))
        
        user = users.find_one({"name": name, "roll_no": roll_no})
        if user:
            return redirect(url_for("home"))
        else:
            flash("Incorrect name or roll number!", "error")
            return redirect(url_for("log_in"))

    return render_template('/auth/log-in.html', hide_nav_footer=True)

# Define a route for an API endpoint
@app.route('/api/data')
def get_data():
   return render_template('/templates/index.html')

if __name__ == '__main__':
    app.run(debug=True)