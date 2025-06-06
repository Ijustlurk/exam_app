import 'package:flutter/material.dart';
import 'package:exam_app/core/models/exams.dart';
import 'package:exam_app/core/themes/colors.dart';

class ExamList extends StatelessWidget {
  final List<Exam> exams;
  final String emptyMessage;

  const ExamList({
    super.key,
    required this.exams,
    this.emptyMessage = 'No exams recorded yet.',
  });

  @override
  Widget build(BuildContext context) {
    if (exams.isEmpty) {
      return Center(
        child: Text(emptyMessage, style: const TextStyle(color: Colors.grey)),
      );
    }
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: exams.length,
      separatorBuilder: (context, i) => const SizedBox(height: 16),
      itemBuilder: (context, i) {
        final exam = exams[i];
        return Center(
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(129, 0, 0, 0),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Subject: ${exam.subject}'),
                Text('Teacher: ${exam.teacher}'),
                Text('Schedule: ${exam.schedule.toString().substring(0, 16)}'),
                Text(
                  'Duration: ${exam.duration.inHours}h ${exam.duration.inMinutes % 60}m',
                ),
                Text('Items: ${exam.noOfItems}'),
                Text('Score: ${exam.scores}'),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector( //review button
                      onTap: exam.isApprovedforReview
                          ? () {
                              Navigator.of(context).pushNamed(
                                '/exam-review',
                                arguments: {'examId': exam.examId},
                              );
                            }
                          : null,
                      child: Container(
                        height: 45,
                        width: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: exam.isApprovedforReview ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Review',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                      
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
