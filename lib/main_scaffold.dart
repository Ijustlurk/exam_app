import 'package:flutter/material.dart';
import 'package:exam_app/features/home/presentation/pages/home_page.dart';
import 'package:exam_app/features/profile/presentation/pages/profile_main.dart';
import 'package:exam_app/themes/colors.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(showNavBar: false),
    ProfileMain(showNavBar: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildAppBottomNavBar(),
    );
  }

  Widget _buildAppBottomNavBar() {
    const tabs = [
      BottomNavTab(
        label: 'Review Exams',
        outlinedIcon: Icons.folder_open_outlined,
        filledIcon: Icons.folder,
      ),
      BottomNavTab(
        label: 'Profile',
        outlinedIcon: Icons.person_outline,
        filledIcon: Icons.person,
      ),
    ];
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
                left: _selectedIndex * tabWidth,
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
                  final isSelected = index == _selectedIndex;
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isSelected ? tabs[index].filledIcon : tabs[index].outlinedIcon,
                            color: isSelected ? AppColors.iconFill : Colors.grey,
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
