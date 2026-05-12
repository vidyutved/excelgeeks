# excelgeeks

Introduction
ExcelGeeks is a lightweight and distraction-free study platform designed for college students and
self-learners. It helps users organize, manage, and access study material locally through a clean interface
without requiring an internet connection.

##How to Launch

#Windows:
Double-click Start_ExcelGeeks.bat

#macOS:
Double-click Start_ExcelGeeks.command

#Linux:
Run bash Start_ExcelGeeks.sh in the terminal
After launching the application, the browser opens automatically at:
http://localhost:8765
Default password:
excel@geeks
Adding Study Material

#Step 1:
Prepare your HTML files. Each study page should be a single .html file.

#Step 2:
Move your HTML files into the pages folder.
Example structure:
ExcelGeeks/
Start_ExcelGeeks.bat
server.py
app/
data/
pages/
cpp_oops.html
java_basics.html
dbms_notes.html

#Step 3:
Start ExcelGeeks using the launcher for your operating system.

#Step 4:
Open the Content Manager from the sidebar.

#Step 5:
Assign study pages to topics.
Example:
C++ OOPs
Classes and Objects -> cpp_intro.html
Constructors -> constructors.html

#Step 6:
Save the mapping.

#Step 7:
Open any subject and access the linked study pages.
Requirements
Python 3.7 or above
Modern browser such as Chrome, Firefox, Edge, or Safari
No internet connection required
Folder Reference
pages/
Stores study material
data/
Stores progress and saved data
app/index.html
Main frontend interface
server.py
Runs the local backend server
Start_ExcelGeeks.bat
Windows launcher
Start_ExcelGeeks.sh
Linux launcher
Start_ExcelGeeks.command
macOS launcher
Troubleshooting
Study pages not visible:
Ensure all files are .html files and located inside the pages directory.
Images missing:
Use relative paths or embed images directly into the HTML.
Browser says the site cannot be reached:
Ensure the local Python server is running.
Terminal closes instantly:
Python may not be installed or added to PATH.
Download Python from:
https://www.python.org/
Features
Offline-first learning
Lightweight and portable
Password-protected access
Fast local performance
Organized subject management
Distraction-free interface
Useful for exam preparation
Future Improvements
AI-powered recommendations
Cloud synchronization
Progress analytics
Collaborative study rooms
Mobile application support
ExcelGeeks helps students stay organized and prepare efficiently
