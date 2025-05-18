import 'package:exam_app/features/common/button.dart';
import 'package:exam_app/features/home/presentation/pages/home_page.dart';
import 'package:exam_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/themes/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'assets/icons/logo.png',
                  height: 100,
                  width: 100,
                ),
                Column(
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 29,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Log in to access your account.',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 35),
                    textFields(
                      hintText: 'Username',
                      controller: userNameController,
                      obscureText: false,
                    ),
                    textFields(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      isPasswordField: true,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'Log In',
                      onPressed: () => _goToHomePage(),
                      width: 280,
                      height: 60,
                      backgroundColor: AppColors.button,
                      textColor: Colors.white,
                      borderRadius: 6,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 60),
                    _loginDivider(),
                    const SizedBox(height: 50),
                    _socialMediaLoginButtons(),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No account yet?",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: SignupPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Create an Account",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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

  Padding _socialMediaLoginButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            FontAwesomeIcons.facebook,
            color: AppColors.white,
            size: 45,
            shadows: [
              Shadow(
                color: const Color.fromARGB(64, 0, 0, 0),
                offset: const Offset(0, 5),
                blurRadius: 16,
              ),
            ],
          ),
          Icon(
            FontAwesomeIcons.google,
            color: AppColors.white,
            size: 45,
            shadows: [
              Shadow(
                color: const Color.fromARGB(64, 0, 0, 0),
                offset: const Offset(0, 5),
                blurRadius: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _loginDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),
        ),
        Text(
          'Or login via',
          style: TextStyle(
            color: AppColors.textFieldFill,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),
        ),
      ],
    );
  }

  void _goToHomePage() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: const HomePage(),
      ),
    );
  }

  Widget textFields({
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
    bool isPasswordField = false,
  }) {
    return SizedBox(
      height: 60,
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldFill,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textFieldHint,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: AppColors.textFieldFocusedBorder,
              width: 1.0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          suffixIcon:
              isPasswordField
                  ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                  : null,
        ),
      ),
    );
  }
}
