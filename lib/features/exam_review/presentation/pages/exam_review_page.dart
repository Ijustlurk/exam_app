import 'package:exam_app/features/data/models/exams.dart';
import 'package:exam_app/features/data/models/exams/questions/question.dart' as qmodel;
import 'package:exam_app/features/data/models/exams/student_answers/student_answers.dart' as ansmodel;
import 'package:exam_app/features/common/widgets/question_navigation_grid.dart';
import 'package:exam_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/features/exam_review/presentation/pages/review_question_view.dart';
import 'package:exam_app/features/data/models/exams/answer_key_and_choices/choice.dart';

class ExamReviewPage extends StatefulWidget {
  final String examId;
  const ExamReviewPage({Key? key, required this.examId}) : super(key: key);

  @override
  State<ExamReviewPage> createState() => _ExamReviewPageState();
}

class _ExamReviewPageState extends State<ExamReviewPage> {
  late final List<qmodel.Question> _questions;
  late final List<ansmodel.StudentAnswers> _studentAnswers;
  Exam? _exam;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _questions = qmodel.mockQuestions.where((q) => q.examId == widget.examId).toList();
    _studentAnswers = ansmodel.mockQuestions.where((a) => a.examId == widget.examId).toList();
    final found = mockExams.where((e) => e.examId == widget.examId);
    _exam = found.isNotEmpty ? found.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.white,
      appBar: AppBar(
        title: const Text('Exam Review'),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_exam != null)
                Container(
                  color: Colors.blueGrey[50],
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Text(
                    _exam?.title ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 24),
              if (_questions.isNotEmpty)
                QuestionNavigationGrid(
                  questionCount: _questions.length,
                  currentIndex: _currentIndex,
                  onQuestionSelected: (index) {
                    final question = _questions[index];
                    final choices = mockChoices.where((c) => c.examId == question.examId && c.questionId == question.questionId).toList();
                    // Find the selected answer index for this question
                    ansmodel.StudentAnswers? answer;
                    try {
                      answer = _studentAnswers.firstWhere((a) => a.questionId == question.questionId);
                    } catch (_) {
                      answer = null;
                    }
                    int? selectedChoiceIndex;
                    if (answer != null) {
                      selectedChoiceIndex = choices.indexWhere((c) => c.choiceId == answer!.studentAnswer.toString());
                      if (selectedChoiceIndex == -1) selectedChoiceIndex = null;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReviewQuestionView(
                          question: question,
                          choices: choices,
                          studentAnswer: _studentAnswers[index].studentAnswer,
                          showCorrectness: (_exam?.isFinished ?? true),
                          questionNumber: index + 1,
                        ),
                      ),
                    );
                  },
                  studentAnswers: _studentAnswers,
                  showCorrectness: _exam?.isFinished == true,
                ),
            ],
          ),
        ),
      ),
    );
  }
}