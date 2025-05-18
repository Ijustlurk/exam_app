import 'package:exam_app/features/auth/presentation/pages/login_page.dart';
import 'package:exam_app/features/auth/presentation/widgets/signup_field.dart';
import 'package:exam_app/features/common/button.dart';
import 'package:exam_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleInitialController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldList = [
      SignUpTextFields(
        hintText: 'Username',
        controller: userNameController,
        isPassword: false,
      ),
      SizedBox(height: 10),
      SignUpTextFields(
        hintText: 'Password',
        controller: passwordController,
        isPassword: true,
      ),
      SizedBox(height: 10),
      SignUpTextFields(
        hintText: 'Confirm Password',
        controller: confirmPasswordController,
        isPassword: true,
        confirmPasswordController: passwordController,
      ),
      SizedBox(height: 10),
      SignUpTextFields(
        hintText: 'Email Address',
        controller: emailController,
      ),
      SizedBox(height: 10),
      SignUpTextFields(
        hintText: 'ID Number',
        controller: idNumberController,
      ),
      SizedBox(height: 10),
      SignUpTextFields(
        hintText: 'Last Name',
        controller: lastNameController,
      ),
      SizedBox(height: 10),
      SignUpTextFields(
        hintText: 'First Name',
        controller: firstNameController,
      ),
      SizedBox(height: 10),
      SignUpTextFields(
        hintText: 'Middle Initial',
        controller: middleInitialController,
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 106, 156, 172),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus(); // Dismiss the keyboard
          },
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  'Sign up for an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 29,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Please fill all fields.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 20),
                // Only the text fields are scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: fieldList,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Register",
                  onPressed: () => showSuccessDialog(context),
                  width: 350,
                  height: 75,
                  backgroundColor: AppColors.button,
                  textColor: Colors.white,
                  borderRadius: 16,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _goToLogin(context),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Successfully Registered"),
          content: const Text("Your account has been created successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
                _goToLogin(context);
              },
              child: const Text("Proceed to Login"),
            ),
          ],
        );
      },
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageTransition(type: PageTransitionType.leftToRight, child: LoginPage()),
    );
  }
}
