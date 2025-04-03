import sqlite3
from datetime import datetime
import uuid

def initialize_database(db_path):
    """Create database with only the courses table"""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    cursor.execute(
        '''
            CREATE TABLE IF NOT EXISTS courses (
                course_id TEXT PRIMARY KEY,
                course_name TEXT NOT NULL,
                course_code TEXT NOT NULL,
                course_branch TEXT,
                course_semester TEXT
            )
        '''
    )
    conn.commit()
    conn.close()
    print("Database initialized with courses table")

def add_course(db_path, course_data):
    """Add a single course to the database"""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    try:
        cursor.execute('''
        INSERT INTO courses VALUES (?, ?, ?, ?, ?)
        ''', (
            str(uuid.uuid4().hex),
            course_data['course_name'],
            course_data['course_code'],
            course_data.get('course_branch', ''),
            course_data.get('course_semester', '')
        ))
        conn.commit()
        print(f"Added course: {course_data['course_name']}")
        return True
    except sqlite3.IntegrityError:
        print(f"Course with ID {course_data.get('course_id', '')} already exists")
        return False
    finally:
        conn.close()

def add_sample_courses(db_path):
    """Add some sample courses to the database"""
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
    ]
    
    for course in sample_courses:
        add_course(db_path, course)

if __name__ == "__main__":
    DB_PATH = "examhub.db"
    
    initialize_database(DB_PATH)
    
    add_sample_courses(DB_PATH)
    
    print("\nCourse database setup complete!")