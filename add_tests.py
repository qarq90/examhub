import json
import uuid
import sqlite3
import os
from datetime import datetime

def process_json_files(directory_path, db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    cursor.execute(
        '''
            CREATE TABLE IF NOT EXISTS tests (
                test_id TEXT,
                test_name TEXT,
                test_description TEXT,
                course_name TEXT,
                course_code TEXT,
                course_semester TEXT,
                course_branch TEXT,
                questions TEXT,  -- Storing questions as JSON string
                created_at TEXT,
                test_duration INTEGER
            )
        '''
    )
    
    for filename in os.listdir(directory_path):
        if filename.endswith('.json'):
            file_path = os.path.join(directory_path, filename)
            
            try:
                with open(file_path, 'r') as file:
                    data = json.load(file)
                    
                    questions_json = json.dumps(data['questions'])
                    
                    cursor.execute('''
                    INSERT INTO tests (
                        test_id, 
                        test_name, 
                        test_description, 
                        course_name, 
                        course_code, 
                        course_semester, 
                        course_branch, 
                        questions, 
                        created_at, 
                        test_duration
                    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    ''', (
                        str(uuid.uuid4().hex),
                        data.get('test_name', ''),
                        data.get('test_description', ''),
                        'Paradigms and Computer Programming Fundamentals',  # course_name (empty as not in JSON)
                        'PCPF',  # course_code (empty as not in JSON)
                        'Semester III',  # course_semester (empty as not in JSON)
                        'Information Technology',  # course_branch (empty as not in JSON)
                        questions_json,
                        datetime.now().isoformat(),
                        '20'   # test_duration (empty as not in JSON)
                    ))
                    
                    print(f"Successfully processed {filename}")
                    
            except json.JSONDecodeError:
                print(f"Error decoding JSON in {filename}")
            except KeyError as e:
                print(f"Missing key {e} in {filename}")
            except Exception as e:
                print(f"Error processing {filename}: {str(e)}")
    
    conn.commit()
    conn.close()

if __name__ == "__main__":
    # Configure these paths as needed
    json_directory = "static/json/sem3/pcpf"  
    database_path = "examhub.db"        
    
    process_json_files(json_directory, database_path)
    print("Processing complete!")
