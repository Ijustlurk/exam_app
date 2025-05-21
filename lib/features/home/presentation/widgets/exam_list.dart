import 'package:flutter/material.dart';
import 'package:exam_app/features/data/models/exams.dart';
import 'package:exam_app/themes/colors.dart';
import 'package:exam_app/features/exam_review/presentation/pages/exam_review_page.dart';

class ExamList extends StatelessWidget {
  final List<Exam> exams;
  final String emptyMessage;

  const ExamList({
    Key? key,
    required this.exams,
    this.emptyMessage = 'No exams recorded yet.',
  }) : super(key: key);

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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ExamReviewPage(examId: exam.examId),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
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
