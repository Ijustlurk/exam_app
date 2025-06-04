import 'package:exam_app/core/themes/colors.dart';
import 'package:exam_app/core/models/exams/answer_key_and_choices/choice.dart' as choicesModel;
import 'package:exam_app/core/models/exams/questions/question.dart' as qmodel;
import 'package:exam_app/core/models/exams/student_answers/student_answers.dart';
import 'package:flutter/material.dart';

class ReviewQuestionView extends StatefulWidget {
  final List<qmodel.Question> questions;
  final List<StudentAnswers> studentAnswers;
  final bool showCorrectness;
  final int initialQuestionIndex;

  const ReviewQuestionView({
    super.key,
    required this.questions,
    required this.studentAnswers,
    this.showCorrectness = true,
    this.initialQuestionIndex = 0,
  });

  @override
  State<ReviewQuestionView> createState() => _ReviewQuestionViewState();
}

class _ReviewQuestionViewState extends State<ReviewQuestionView> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialQuestionIndex;
    
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentIndex];
    final choices = choicesModel.mockChoices
        .where((c) => c.questionId == question.questionId)
        .toList();
    final studentAnswer = widget.studentAnswers[_currentIndex];
    final questionNumber = _currentIndex + 1;
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
              // Navigation Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_left),
                    onPressed: _currentIndex > 0
                        ? () {
                            setState(() {
                              _currentIndex--;
                            });
                          }
                        : null,
                  ),
                  Text(
                    'Question $questionNumber',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_right),
                    onPressed: _currentIndex < widget.questions.length - 1
                        ? () {
                            setState(() {
                              _currentIndex++;
                            });
                          }
                        : null,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                question.questionText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...List.generate(choices.length, (index) {
                final choice = choices[index];
                final isStudentChoice = studentAnswer.studentAnswer;
                final isCorrectAnswer = choice.correctAnswer;
                final studentGotCorrect = widget.showCorrectness && isStudentChoice == choice.choiceId && isCorrectAnswer;
                final studentGotIncorrect = widget.showCorrectness && isStudentChoice == choice.choiceId && !isCorrectAnswer;
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
                                  if (choice.choiceId == isStudentChoice)
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
