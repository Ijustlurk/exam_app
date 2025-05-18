import 'package:exam_app/features/auth/presentation/pages/signup_page.dart';
import 'package:exam_app/features/common/button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../auth/presentation/pages/login_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _autoNextPage();
  }

  // Automatically go to next page after 3 seconds
  void _autoNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage == 0) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage = 1;
        });
      }
    });
  }

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = 1;
      });
    }
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
    void _goToSignUp() {
    Navigator.pushReplacement(
      context,
      PageTransition(type: 
      PageTransitionType.leftToRight,
      child: SignupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 106, 156, 172),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildIntroContent(
                title: 'Welcome to Exam-In-Ease',
                description:
                    'Your solution for taking\nyour CICS exams anytime, anywhere.',
                buttonText: "Next",
                onButtonPressed: _nextPage,
              ),
              _buildIntroContent(
                title: 'Sign up now and start using\nthe app for free',
                description: 'Or click here to login to your existing account.',
                buttonText: "Sign Up",
                onButtonPressed: () {
                  // Navigate to sign-up page (replace with actual sign-up page later)
                  _goToSignUp();
                },
                isLoginLink: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method for intro content
  Widget _buildIntroContent({
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onButtonPressed,
    bool isLoginLink = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 15),
              if (isLoginLink)
                GestureDetector(
                  onTap: _goToLogin,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              else
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16),
                  textAlign: TextAlign.left,
                ),
            ],
          ),
          Center(
            child: CustomButton(
              height: 70,
              width: 300,
              onPressed: onButtonPressed,
              backgroundColor: Color.fromARGB(255, 3, 49, 79),
              text: buttonText,
              fontSize: 19,
              fontWeight: FontWeight.w600,
              textColor: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: 4,
            ),
            ),
        ],
      ),
    );
  }
}
