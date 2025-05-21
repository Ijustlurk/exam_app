import 'package:exam_app/features/data/models/exams/answer_key_and_choices/choice.dart';
import 'package:exam_app/features/data/models/exams/questions/question.dart';
import 'package:flutter/material.dart';

class ReviewQuestionView extends StatelessWidget {
  final Question question;
  final List<Choice> choices;
  final bool showCorrectness;
  final String studentAnswer;
  final int questionNumber;

  const ReviewQuestionView({
    super.key,
    required this.question,
    required this.choices,
    this.showCorrectness = true,
    required this.studentAnswer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question $questionNumber'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.questionText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...List.generate(choices.length, (index) {
                final choice = choices[index];
                final isStudentChoice = studentAnswer;
                final isCorrectAnswer = choice.correctAnswer;
                final studentGotCorrect = showCorrectness && isStudentChoice == choice.choiceId && isCorrectAnswer;
                final studentGotIncorrect = showCorrectness && isStudentChoice == choice.choiceId && !isCorrectAnswer;
                Color fillColor = Colors.white;
                Color textColor = Colors.black;
                Color borderColor = Colors.grey[300]!;
                Widget? trailingIcon;
                if (studentGotCorrect) {
                  fillColor = Colors.green[700]!;
                  textColor = Colors.white;
                  borderColor = Colors.green[900]!;
                  if (choice.choiceId == isStudentChoice) {
                    trailingIcon = const Icon(Icons.check, color: Colors.white);
                  }
                } else if (studentGotIncorrect) {
                  fillColor = Colors.red[700]!;
                  textColor = Colors.white;
                  borderColor = Colors.red[900]!;
                  if (choice.choiceId == isStudentChoice) {
                    trailingIcon = const Icon(Icons.close, color: Colors.white);
                  }
                } else if (choice.choiceId != isStudentChoice && isCorrectAnswer) {
                  fillColor = Colors.white;
                  textColor = Colors.green[900]!;
                  borderColor = Colors.green[700]!;
                }
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: borderColor,
                          width: 3,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    choice.choiceText,
                                    style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  if (choice.choiceId == studentAnswer)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        'Your Answer',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (trailingIcon != null) trailingIcon,
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
