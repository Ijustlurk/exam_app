import 'package:flutter/material.dart';
import 'package:exam_app/themes/colors.dart';

class ExamFilterOptions extends StatelessWidget {
  final int selectedYear;
  final int startYear;
  final int endYear;
  final int selectedSemester;
  final int selectedTerm;
  final List<String> terms;
  final ValueChanged<int> onYearChanged;
  final ValueChanged<int> onSemesterChanged;
  final ValueChanged<int> onTermChanged;
  final bool show;
  final VoidCallback? onToggle;

  const ExamFilterOptions({
    Key? key,
    required this.selectedYear,
    required this.startYear,
    required this.endYear,
    required this.selectedSemester,
    required this.selectedTerm,
    required this.terms,
    required this.onYearChanged,
    required this.onSemesterChanged,
    required this.onTermChanged,
    this.show = true,
    this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final years = List.generate(endYear - startYear + 1, (i) => startYear + i);
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: show
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SizedBox(
                    height: 40,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final yearCount = years.length;
                        final tabWidth = 120.0;
                        return SizedBox(
                          width: yearCount * tabWidth,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                  left: years.indexOf(selectedYear) * tabWidth,
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
                                  children: years.map((year) {
                                    final isSelected = year == selectedYear;
                                    return SizedBox(
                                      width: tabWidth,
                                      height: 40,
                                      child: GestureDetector(
                                        onTap: () => onYearChanged(year),
                                        child: Center(
                                          child: Text(
                                            'A.Y. $year-${year + 1}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                              color: isSelected ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  color: const Color.fromARGB(255, 195, 200, 211),
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7),
                  child: SizedBox(
                    height: 40,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final tabWidth = (constraints.maxWidth) / 2;
                        return Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              left: selectedSemester * tabWidth,
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
                                  child: GestureDetector(
                                    onTap: () => onSemesterChanged(0),
                                    child: Center(
                                      child: Text(
                                        'First Semester',
                                        style: TextStyle(
                                          fontWeight: selectedSemester == 0 ? FontWeight.bold : FontWeight.normal,
                                          fontSize: 15,
                                          color: selectedSemester == 0 ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => onSemesterChanged(1),
                                    child: Center(
                                      child: Text(
                                        'Second Semester',
                                        style: TextStyle(
                                          fontWeight: selectedSemester == 1 ? FontWeight.bold : FontWeight.normal,
                                          fontSize: 15,
                                          color: selectedSemester == 1 ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  color: const Color.fromARGB(255, 195, 200, 211),
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  child: SizedBox(
                    height: 40,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final tabWidth = (constraints.maxWidth) / terms.length;
                        return Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              left: selectedTerm * tabWidth,
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
                              children: List.generate(terms.length, (index) {
                                final isSelected = selectedTerm == index;
                                return SizedBox(
                                  width: tabWidth,
                                  height: 40,
                                  child: GestureDetector(
                                    onTap: () => onTermChanged(index),
                                    child: Center(
                                      child: Text(
                                        terms[index],
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
                  ),
                ),
                Divider(
                  color: const Color.fromARGB(255, 195, 200, 211),
                  height: 1,
                  thickness: 1,
                ),
              ],
            )
          : IconButton(
              icon: AnimatedRotation(
                turns: 0.0,
                duration: const Duration(milliseconds: 250),
                child: const Icon(Icons.keyboard_arrow_down),
              ),
              onPressed: onToggle,
            ),
    );
  }
}
