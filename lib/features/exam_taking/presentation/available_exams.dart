import 'package:exam_app/core/models/exams.dart';
import 'package:exam_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AvailableExams extends StatefulWidget {
  const AvailableExams({super.key});

  @override
  State<AvailableExams> createState() => _AvailableExamsState();
}

class _AvailableExamsState extends State<AvailableExams> {
  int _selectedFilter = 0; // 0: Saved Exams, 1: Online Exams
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Populate with mock exam titles from the model
  }

  List<Exam> _filteredExamObjects() {
    final exams = _selectedFilter == 0 ? mockExams : <Exam>[];
    return exams.where((exam) => exam.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredExamObjects = _filteredExamObjects();
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Exams'),
        backgroundColor: AppColors.lightGrey,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for Exams',
                    hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) => setState(() {
                    _searchQuery = value;
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _filterBySavedOrOnline(),
            const SizedBox(height: 24),
            _savedExamsList(filteredExamObjects),
          ],
        ),
      ),
    );
  }

  Expanded _savedExamsList(List<Exam> filteredExamObjects) {
    return Expanded(
            child: filteredExamObjects.isEmpty
                ? Center(
                    child: Text(
                      'No exams available, \nor try connecting to the Internet,\n or click to receive an exam.',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredExamObjects.length,
                    itemBuilder: (context, index) {
                      final exam = filteredExamObjects[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        exam.title,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                    ),
                                    Text(
                                      exam.schedule.toLocal().toString().split(' ')[0],
                                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Teacher: 	${exam.teacher}', style: const TextStyle(fontSize: 15)),
                                Text('Subject: 	${exam.subject}', style: const TextStyle(fontSize: 15)),
                                Text('No. of Items: 	${exam.noOfItems.toInt()}', style: const TextStyle(fontSize: 15)),
                                Text('Duration: 	${exam.duration.inMinutes} min', style: const TextStyle(fontSize: 15)),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // TODO: Implement navigation to exam taking page
                                    },
                                    icon: const Icon(Icons.play_arrow),
                                    label: const Text('Take Exam'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
  }

  Widget _filterBySavedOrOnline() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _selectedFilter == 0 ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: Container(
                width: 173.7,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.optionSelected,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = 0;
                      });
                    },
                    child: Center(
                      child: Text(
                        'Saved Exams',
                        style: TextStyle(
                          fontWeight: _selectedFilter == 0 ? FontWeight.bold : FontWeight.normal,
                          color: _selectedFilter == 0 ? const Color.fromARGB(255, 255, 255, 255) : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = 1;
                      });
                    },
                    child: Center(
                      child: Text(
                        'Online Exams',
                        style: TextStyle(
                          fontWeight: _selectedFilter == 1 ? FontWeight.bold : FontWeight.normal,
                          color: _selectedFilter == 1 ? const Color.fromARGB(255, 255, 255, 255) : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
