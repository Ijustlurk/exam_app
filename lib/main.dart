import 'package:exam_app/features/auth/presentation/pages/login_page.dart';
import 'package:exam_app/features/exam_review/presentation/pages/exam_review_page.dart';
import 'package:exam_app/features/exam_review/presentation/pages/review_question_view.dart';
import 'package:exam_app/features/exam_taking/presentation/pages/Available_Exams.dart';
import 'package:exam_app/features/home/presentation/pages/home_page.dart';
import 'package:exam_app/features/profile/presentation/pages/profile_main.dart';
import 'package:exam_app/features/splash/presentation/pages/splash_page.dart';
import 'package:exam_app/main_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainScaffold(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfileMain(),
        '/available-exams': (context) => const AvailableExams(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/exam-review') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ExamReviewPage(examId: args['examId']),
          );
        }
        if (settings.name == '/review-question') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ReviewQuestionView(
              questions: args['questions'],
              studentAnswers: args['studentAnswers'],
              showCorrectness: args['showCorrectness'],
              initialQuestionIndex: args['initialQuestionIndex'],
            ),
          );
        }
        return null;
      },
    );
  }
}