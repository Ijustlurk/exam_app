import 'package:flutter/material.dart';
import 'package:exam_app/themes/colors.dart';

class ExamFilterOptions extends StatelessWidget {
  final Widget yearsSelector;
  final Widget semesterSelector;
  final Widget termSelector;
  final bool show;

  const ExamFilterOptions({
    Key? key,
    required this.yearsSelector,
    required this.semesterSelector,
    required this.termSelector,
    this.show = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: show
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(children: [yearsSelector]),
                  ),
                ),
                Divider(
                  color: const Color.fromARGB(255, 195, 200, 211),
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7),
                  child: semesterSelector,
                ),
                Divider(
                  color: const Color.fromARGB(255, 195, 200, 211),
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  child: termSelector,
                ),
                Divider(
                  color: const Color.fromARGB(255, 195, 200, 211),
                  height: 1,
                  thickness: 1,
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
