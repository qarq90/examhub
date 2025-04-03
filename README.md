# ExamHub 🚀

A modern web application for managing exams and courses built with Python Flask and Tailwind CSS.

![Tech Stack](https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)

## Features ✨

- 📝 Create and manage exams
- 📚 Course management system
- 🧪 Test creation interface
- 🗃️ SQLite database backend
- 🎨 Modern UI with Tailwind CSS

## Prerequisites 📋

- Python 3.8+
- Node.js 16+
- npm or yarn

## Setup Guide 🛠️

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/examhub.git
cd examhub
```

### 2.Install Python Dependencies
```bash
pip install -r requirements.txt
```
### 3.Install Tailwind
```bash
npm i tailwind @tailwindcss/typography prettier-plugin-tailwindcss
OR
npm install
```

### 4. Set Up Environment Variables
Create a .env file in the root directory:
FLASK_APP=app.py
FLASK_ENV=development
SECRET_KEY=your-secret-key-here

## Running the Application 🚀

```bash
py app.py
```

The app will be available at [http://localhost:5000](http://127.0.0.1:5000/)

## Project Structure 📂

    ├── node_modules/       # Node.js dependencies
    ├── static/            # Static files (CSS, JS, images)
    ├── templates/         # Flask HTML templates
    ├── app.py             # Main application file
    ├── examhub.db         # SQLite database
    ├── add_courses.py     # Course management script
    ├── add_tests.py       # Test management script
    ├── package.json       # Node.js dependencies
    ├── requirements.txt   # Python dependencies
    └── tailwind.config.js # Tailwind CSS configuration

## Contributing 🤝

    Fork the project
    Create your feature branch (git checkout -b feature/AmazingFeature)
    Commit your changes (git commit -m 'Add some AmazingFeature')
    Push to the branch (git push origin feature/AmazingFeature)
    Open a Pull Request
