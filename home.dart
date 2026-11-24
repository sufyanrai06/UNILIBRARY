import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String studentId;
  final String studentName;

  const HomeScreen({
    super.key,
    required this.studentId,
    required this.studentName,
  });

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Do you want to sign out of UniLibrary?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.of(context).pop('Signed out of UniLibrary');
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Hello, $studentId'),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () => _showSignOutDialog(context),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.teal.shade100,
                backgroundImage:
                    const AssetImage('assets/images/profile_pic.jpeg'),
              ),
              const SizedBox(height: 16),
              Text(
                studentName,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade900,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'You are signed in to UniLibrary',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
