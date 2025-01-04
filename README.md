# Create-signUp-page-Task
# overview
signup page to access the shopping screen
# What This Code Do ?
1. Form UI:
- A form with fields for entering the full name, email, password, and confirming the password.
- Each field includes validation rules to ensure data integrity.
2. Password Visibility Toggle:
- Users can toggle password visibility for both the password and confirm password fields.
3. Validation:
- Ensures the full name starts with a capital letter.
- Validates the email format (must include @gmail.com).
- Ensures the password is at least 6 characters long.
- Checks that the password and confirm password fields match.
4. Dialog Confirmation:
- Displays a confirmation dialog upon successful account creation.
- Redirects users to the MyHomePage after account creation.
# How the Code Works ?
1. Form Structure:
- The form uses a GlobalKey<FormState> to manage its state and validate user inputs.
- Input fields are implemented with TextFormField widgets, each having its own validation logic.
2. Validation Logic:
- Full Name: Must not be empty and the first letter should be capitalized.
- Email: Must include @gmail.com to ensure a proper format.
- Password: Should be at least 6 characters long.
- Confirm Password: Must match the entered password.
3. Password Visibility:
- The code includes toggling functionality (togglePassword and toggleConfirm) for the password and confirm password fields.
- Users can click on an icon to show or hide the password text.
4. Sign Up Button:
- When clicked:
 -  Validates the form.
 -  If validation passes, it triggers myDialog() to show a success message.
 -  Logs the entered data to the console for debugging purposes.
5. Success Dialog:
- Displays an AlertDialog with a success message when the account is created.
- Includes an "OK" button, which:
- Closes the dialog.
- Navigates the user to the homepage (MyHomePage).
6. Navigation:
- The app uses Navigator.push() to transition from the Signup page to the homepage after the user successfully signs up.
