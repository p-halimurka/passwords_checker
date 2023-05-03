### Passwords checker app

Hello! This is an app for checking a number of correct passwords with given conditions.
To properly use the app:
1. `git clone` this repo
2. Create *.txt file with passwords conditions (or use **passwords_file.txt** for this purpose), like this: **z 1-10: password**, where **z** is a character you want to check for inclusion in **password**, and **1-10:** is a range that encompasses number of required character occurences in **password**. Please note that every password condition should be inputted on new line.
3. Run `ruby run_app.rb`
4. Input path to a specified file with password data
