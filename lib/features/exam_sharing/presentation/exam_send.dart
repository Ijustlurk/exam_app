import 'package:flutter/material.dart';
import 'package:exam_app/core/themes/colors.dart';
import 'package:exam_app/core/models/exams.dart';

class ExamSend extends StatefulWidget {
  const ExamSend({super.key});

  @override
  State<ExamSend> createState() => _ExamSendState();
}

class _ExamSendState extends State<ExamSend> {
  // Track selected exams by examId
  final Set<String> _selectedExamIds = {};

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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Select Exams to Share',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search exams...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
              enabled: false, // Placeholder only
            ),
          ),
          const SizedBox(height: 10),
          // Select All Option
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Checkbox(
                  value: _selectedExamIds.length == mockExams.length && mockExams.isNotEmpty,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedExamIds.addAll(mockExams.map((e) => e.examId));
                      } else {
                        _selectedExamIds.clear();
                      }
                    });
                  },
                ),
                const Text('Select All'),
                const Spacer(),
                // Filter Options Placeholder
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list),
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'Subject 1', child: Text('Subject 1')),
                    PopupMenuItem(value: 'Subject 2', child: Text('Subject 2')),
                    PopupMenuItem(value: 'Subject 3', child: Text('Subject 3')),
                  ],
                  onSelected: (value) {
                    // Placeholder: No filter logic yet
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: mockExams.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final exam = mockExams[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedExamIds.contains(exam.examId)) {
                        _selectedExamIds.remove(exam.examId);
                      } else {
                        _selectedExamIds.add(exam.examId);
                      }
                    });
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Checkbox(
                        value: _selectedExamIds.contains(exam.examId),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _selectedExamIds.add(exam.examId);
                            } else {
                              _selectedExamIds.remove(exam.examId);
                            }
                          });
                        },
                      ),
                      title: Text(
                        exam.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Teacher: ${exam.teacher}'),
                          Text('Subject: ${exam.subject}'),
                          Text('Duration: ${exam.duration.inMinutes} min'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 70, 
        height: 70,
        margin: const EdgeInsets.only(bottom: 16, right: 8),
        child: FloatingActionButton(
          onPressed: _selectedExamIds.isNotEmpty ? () {
            // TODO: Implement share action
          } : null,
          backgroundColor: _selectedExamIds.isNotEmpty ? AppColors.background : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.send, size: 30, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}