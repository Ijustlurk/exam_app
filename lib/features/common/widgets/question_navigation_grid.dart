
import 'package:flutter/material.dart';
import 'package:exam_app/features/data/models/exams/student_answers/student_answers.dart';

class QuestionNavigationGrid extends StatelessWidget {
  final int questionCount;
  final int currentIndex;
  final ValueChanged<int> onQuestionSelected;
  final List<StudentAnswers> studentAnswers;
  final bool showCorrectness;

  const QuestionNavigationGrid({
    super.key,
    required this.questionCount,
    required this.currentIndex, //current question index
    required this.onQuestionSelected,
    required this.studentAnswers,
    this.showCorrectness = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemCount: questionCount,
      itemBuilder: (context, index) {
        // Find the answer for this question (questionId is index+1 as string)
        StudentAnswers? answer;
        try {
          answer = studentAnswers.firstWhere(
            (a) => a.questionId == '${index + 1}',
          );
        } catch (_) {
          answer = null;
        }
        Color borderColor = Colors.transparent;
        double borderWidth = 2;
        if (showCorrectness && answer != null) {
          if (answer.isCorrect) {
            borderColor = Colors.green;
            borderWidth = 4;
          } else {
            borderColor = Colors.red;
            borderWidth = 4;
          }
        }
        return SizedBox(
          width: 100, // Set your desired width
          height: 100, // Set your desired height
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor, width: borderWidth),
              ),
              elevation: 4,
            ),
            onPressed: () => onQuestionSelected(index),
            child: Text('${index + 1}'),
          ),
        );
      },
    );
  }
}
