import 'package:flutter/material.dart';
import 'signin.dart';

void main() {
  runApp(const UniLibraryApp());
}

class UniLibraryApp extends StatelessWidget {
  const UniLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniLibrary - BSIT-F23-M14',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: false,
      ),
      home: const SignInScreen(),
    );
  }
}
