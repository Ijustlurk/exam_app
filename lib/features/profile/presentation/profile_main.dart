import 'package:exam_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/routes.dart';

class ProfileMain extends StatefulWidget {
  final bool showNavBar;
  const ProfileMain({super.key, this.showNavBar = true});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {

  bool _isDarkMode = false;// Default to Profile tab
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
            padding: const EdgeInsets.only(top: 50),
            height: 200,

            decoration: BoxDecoration(color: AppColors.lightGrey),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 40),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.iconFill, width: 4),
                  ),
                  child: Image.asset(
                    'assets/icons/profileicon.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'User Full Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                ProfileOptionTile(
                  icon: Icons.person_2_outlined,
                  text: 'Account Settings',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileOptionTile(
                  icon: Icons.share_outlined,
                  text: 'Exam Sharing',
                  onTap: () async {
                    await _shareDialog(context);
                  },
                ),
                const SizedBox(height: 20),
                ProfileOptionTile(
                  icon: _isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined,
                  text: 'Dark Mode',
                  hasSwitch: true,
                  switchValue: _isDarkMode,
                  onSwitchChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                  },
                ),
                const SizedBox(height: 20),
                ProfileOptionTile(
                  icon: Icons.logout,
                  text: 'Log Out',
                    onTap: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                      title: const Text('Confirm Log Out'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                        ),
                        TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Log Out'),
                        ),
                      ],
                      ),
                    );
                    if (confirmed == true) {
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _shareDialog(BuildContext context) async {
    return await showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Exam Sharing', style: TextStyle(fontSize: 20)),
                            const SizedBox(height: 24),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.send, color: const Color.fromARGB(255, 122, 140, 155), size: 32),
                                title: Text('Send'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed('/exam-send');
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.download, color:  const Color.fromARGB(255, 122, 140, 155), size: 32),
                                title: Text('Receive',),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed('/exam-receive');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  const ProfileOptionTile({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: hasSwitch ? null : onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.iconFill, size: 30),
            const SizedBox(width: 20),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
            if (hasSwitch)
              Switch(value: switchValue, onChanged: onSwitchChanged, activeColor: AppColors.iconFill,)
            else
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
