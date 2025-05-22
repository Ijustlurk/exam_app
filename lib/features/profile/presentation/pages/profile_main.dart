
import 'package:flutter/material.dart';

class ProfileMain extends StatefulWidget {
  final bool showNavBar;
  const ProfileMain({super.key, this.showNavBar = true});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  int _selectedNavIndex = 1; // Default to Profile tab
  @override
  void initState() {
    super.initState();
    // Initialize any data or state here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Row(
              children: [],
            ),
          ),
          // Add your profile details here
        ],
      ),
    );
  }
}