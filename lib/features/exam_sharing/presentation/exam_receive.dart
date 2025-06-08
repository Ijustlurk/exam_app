import 'package:exam_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ExamReceive extends StatefulWidget {
  const ExamReceive({super.key});

  @override
  State<ExamReceive> createState() => _ExamReceiveState();
}

class _ExamReceiveState extends State<ExamReceive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Sharing'),
        backgroundColor: AppColors.lightGrey,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(    
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Container(
                  width: 250,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Receive Exams',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[400]!, width: 2),
                  ),
                  child: Icon(
                    Icons.qr_code_2,
                    size: 190,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'To receive an exam, have the sender scan this QR code.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
