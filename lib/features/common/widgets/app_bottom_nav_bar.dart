import 'package:flutter/material.dart';
import 'package:exam_app/themes/colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavTab> tabs;

  const AppBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = constraints.maxWidth / tabs.length;
          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: currentIndex * tabWidth,
                bottom: 0,
                child: Container(
                  width: tabWidth,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.iconFill,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = index == currentIndex;
                  return Expanded(
                    child: InkWell(
                      onTap: () => onTap(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isSelected ? tabs[index].filledIcon : tabs[index].outlinedIcon,
                            color: isSelected ?  AppColors.iconFill : Colors.grey,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            tabs[index].label,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? AppColors.iconFill : Colors.grey,
                            ),
                          ),
                        ],
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
}

class BottomNavTab {
  final String label;
  final IconData outlinedIcon;
  final IconData filledIcon;

  const BottomNavTab({
    required this.label,
    required this.outlinedIcon,
    required this.filledIcon,
  });
}
