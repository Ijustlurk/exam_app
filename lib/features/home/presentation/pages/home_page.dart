import 'package:exam_app/features/common/widgets/app_bottom_nav_bar.dart';
import 'package:exam_app/features/common/widgets/exam_filter_options.dart';
import 'package:exam_app/features/home/models/exam.dart';
import 'package:exam_app/themes/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedYear;
  final int _startYear = 2024;
  final int _endYear = 2027;
  int _selectedSemester = 0; // 0: First Semester, 1: Second Semester
  int _selectedTerm = 0; // 0: Prelim, 1: Midterm, 2: Final
  bool _showFilters = true; // Controls filter visibility
  int _selectedNavIndex = 0;

  final List<String> _terms = ['Prelim', 'Midterm', 'Final'];

  List<int> get _years =>
      List.generate(_endYear - _startYear + 1, (i) => _startYear + i);

  @override
  void initState() {
    super.initState();
    _selectedYear = _years.first;
    _showFilters = false; // Start with filters hidden
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams Taken'),
        backgroundColor: AppColors.lightGrey,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(_showFilters ? Icons.filter_alt : Icons.filter_alt_outlined),
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
        child: Column(
          children: [
            ExamFilterOptions(
              yearsSelector: _yearsScrollBar(),
              semesterSelector: _semesterSelector(),
              termSelector: _termSelector(),
              show: _showFilters,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
                child: _examsList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          setState(() {
            _selectedNavIndex = index;
            // Navigation logic can be added here
          });
        },
        tabs: const [
          BottomNavTab(
            label: 'Exams Taken',
            outlinedIcon: Icons.folder_open_outlined,
            filledIcon: Icons.folder,
          ),
          BottomNavTab(
            label: 'Profile',
            outlinedIcon: Icons.person_outline,
            filledIcon: Icons.person,
          ),
        ],
      ),
    );
  }

  Widget _termSelector() {
    return SizedBox(
      height: 40,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = (constraints.maxWidth) / _terms.length;
          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: _selectedTerm * tabWidth,
                top: 0,
                child: Container(
                  height: 40,
                  width: tabWidth,
                  decoration: BoxDecoration(
                    color: AppColors.optionSelected,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Row(
                children: List.generate(_terms.length, (index) {
                  final isSelected = _selectedTerm == index;
                  return SizedBox(
                    width: tabWidth,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTerm = index;
                        });
                      },
                      child: Center(
                        child: Text(
                          _terms[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _semesterSelector() {
    return SizedBox(
      height: 40,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth =
              (constraints.maxWidth) / 2; // 24 is the divider width
          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left:
                    _selectedSemester *
                    (tabWidth), // 12 is half the divider width
                top: 0,
                child: Container(
                  height: 40,
                  width: tabWidth,
                  decoration: BoxDecoration(
                    color: AppColors.optionSelected,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SemesterTab(
                      title: 'First Semester',
                      selected: _selectedSemester == 0,
                      onTap: () {
                        setState(() {
                          _selectedSemester = 0;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: SemesterTab(
                      title: 'Second Semester',
                      selected: _selectedSemester == 1,
                      onTap: () {
                        setState(() {
                          _selectedSemester = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _yearsScrollBar() {
    return SizedBox(
      height: 40,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final yearCount = _years.length;
          final tabWidth = 120.0; // Fixed width for each year tab
          return SizedBox(
            width: yearCount * tabWidth,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  left: _years.indexOf(_selectedYear) * tabWidth,
                  top: 0,
                  child: Container(
                    height: 40,
                    width: tabWidth,
                    decoration: BoxDecoration(
                      color: AppColors.optionSelected,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Row(
                  children:
                      _years.map((year) {
                        final isSelected = year == _selectedYear;
                        return SizedBox(
                          width: tabWidth,
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedYear = year;
                              });
                            },
                            child: Center(
                              child: Text(
                                'A.Y. $year-${year + 1}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _examsList() {
    final filtered = mockExams.where((exam) {
      final yearMatch = exam.schedule.year == _selectedYear;
      final semesterMatch = exam.semester ==
          (_selectedSemester == 0 ? 'First Semester' : 'Second Semester');
      final termMatch = exam.term.toLowerCase() == _terms[_selectedTerm].toLowerCase();
      return yearMatch && semesterMatch && termMatch;
    }).toList();
    if (filtered.isEmpty) {
      return Center(
        child: Text('No exams recorded yet.', style: TextStyle(color: Colors.grey)),
      );
    }
    return ListView.separated(
      // Remove shrinkWrap and physics so ListView can scroll in Expanded
      scrollDirection: Axis.vertical,
      itemCount: filtered.length,
      separatorBuilder: (context, i) => const SizedBox(height: 16),
      itemBuilder: (context, i) {
        final exam = filtered[i];
        return Center(
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
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
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (exam.isActive)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    if (exam.isFinished)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Finished',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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

class SemesterTab extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const SemesterTab({
    required this.title,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 150,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontSize: 15,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
