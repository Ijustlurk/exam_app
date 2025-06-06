import 'package:exam_app/features/exam_sharing/presentation/exam_receive.dart';
import 'package:exam_app/features/exam_sharing/presentation/exam_send.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/routes.dart';
import 'package:exam_app/features/auth/presentation/login_page.dart';
import 'package:exam_app/features/exam_review/presentation/exam_review_page.dart';
import 'package:exam_app/features/exam_review/presentation/review_question_view.dart';
import 'package:exam_app/features/exam_taking/presentation/available_exams.dart';
import 'package:exam_app/features/home/presentation/home_page.dart';
import 'package:exam_app/features/profile/presentation/profile_main.dart';
import 'package:exam_app/features/splash/presentation/splash_page.dart';
import 'package:exam_app/main_scaffold.dart';

Route<dynamic>? appOnGenerateRoute(RouteSettings settings) {
  if (settings.name == AppRoutes.examReview) {
    final args = settings.arguments as Map<String, dynamic>;
    return MaterialPageRoute(
      builder: (context) => ExamReviewPage(examId: args['examId']),
    );
  }
  if (settings.name == AppRoutes.reviewQuestion) {
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
}

Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.splash: (context) => const SplashPage(),
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.main: (context) => const MainScaffold(),
  AppRoutes.home: (context) => const HomePage(),
  AppRoutes.profile: (context) => const ProfileMain(),
  AppRoutes.availableExams: (context) => const AvailableExams(),
  AppRoutes.examSend: (context) => const ExamSend(), 
  AppRoutes.examReceive: (context) => const ExamReceive(), 
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: appRoutes,
      onGenerateRoute: appOnGenerateRoute,
    );
  }
}

void main() {
  runApp(const MyApp());
}