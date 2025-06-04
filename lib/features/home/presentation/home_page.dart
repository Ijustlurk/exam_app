import 'package:exam_app/common/widgets/exam_filter_options.dart';
import 'package:exam_app/core/models/exams.dart';
import 'package:exam_app/features/home/presentation/exam_list.dart';
import 'package:exam_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final bool showNavBar;
  const HomePage({super.key, this.showNavBar = true});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedYear = -1; // -1 means 'Recent'
  final int _startYear = 2024;
  final int _endYear = 2027;
  int? _selectedSemester; // null means no filter
  int? _selectedTerm; // null means no filter
  bool _showFilters = false; // Start with filters hidden
  final List<String> _terms = ['Prelim', 'Midterm', 'Final'];

  @override
  void initState() {
    super.initState();
    _showFilters = false; // Start with filters hidden
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Exams'),
        backgroundColor: AppColors.lightGrey,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(
              _showFilters ? Icons.filter_alt : Icons.filter_alt_outlined,
            ),
            tooltip: _showFilters ? 'Hide Filters' : 'Show Filters',
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                ExamFilterOptions(
                  selectedYear: _selectedYear,
                  startYear: _startYear,
                  endYear: _endYear,
                  selectedSemester: _selectedSemester ?? -1,
                  selectedTerm: _selectedTerm ?? -1,
                  terms: _terms,
                  onYearChanged: (year) {
                    setState(() {
                      _selectedYear = year;
                    });
                  },
                  onSemesterChanged: (semester) {
                    setState(() {
                      _selectedSemester = semester;
                    });
                  },
                  onTermChanged: (term) {
                    setState(() {
                      _selectedTerm = term;
                    });
                  },
                  show: _showFilters,
                  onToggle: () {
                    setState(() {
                      _showFilters = !_showFilters;
                    });
                  },
                ),
                if (_showFilters)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      icon: const Icon(Icons.clear),
                      label: const Text('Clear Filters'),
                      onPressed: () {
                        setState(() {
                          _selectedYear = -1;
                          _selectedSemester = null;
                          _selectedTerm = null;
                          _showFilters = !_showFilters;
                        });
                      },
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ExamList(exams: _filteredExams()),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 20,
              bottom: 20, // Just above the bottom nav bar
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 150,
                  height: 60,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/available-exams');
                    },
                    backgroundColor: const Color.fromARGB(255, 220, 227, 241),
                    elevation: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0)),
                        Text(
                          'Take Exam',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Exam> _filteredExams() {
    if (_selectedYear == -1 &&
        _selectedSemester == null &&
        _selectedTerm == null) {
      // Show recent finished exams (sorted by schedule descending)
      return List<Exam>.from(mockExams.where((exam) => exam.isFinished == true))
        ..sort((a, b) => b.schedule.compareTo(a.schedule));
    } else {
      final filtered =
          mockExams.where((exam) {
            final yearMatch =
                _selectedYear == -1 || exam.schedule.year == _selectedYear;
            final semesterMatch =
                _selectedSemester == null ||
                exam.semester ==
                    (_selectedSemester == 0
                        ? 'First Semester'
                        : 'Second Semester');
            final termMatch =
                _selectedTerm == null ||
                exam.term.toLowerCase() == _terms[_selectedTerm!].toLowerCase();
            final isFinishedMatch = exam.isFinished == true;
            return yearMatch && semesterMatch && termMatch && isFinishedMatch;
          }).toList();
      if (_selectedYear == -1) {
        filtered.sort((a, b) => b.schedule.compareTo(a.schedule));
      }
      return filtered;
    }
  }
}
