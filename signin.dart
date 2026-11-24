import 'package:flutter/material.dart';
import 'home.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  bool _obscurePin = true;
  String _statusMessage = '';

  void _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _statusMessage = '';
      });

      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            studentId: _idController.text.trim().toUpperCase(),
            studentName: 'Abu Sufyan',
          ),
        ),
      );

      if (result != null && result is String) {
        setState(() {
          _statusMessage = result;
          _pinController.clear();
        });
      }
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.teal.shade50,
                backgroundImage:
                    const AssetImage('assets/images/library_logo.png'),
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome to UniLibrary',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 25),

              // Field 1: Student ID (Roll No: BSIT-F23-M14)
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Student ID',
                  hintText: 'e.g. BSIT-F23-M14',
                  filled: true,
                  fillColor: Colors.teal.shade50,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.teal.shade700,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Student ID is required';
                  }
                  if (value.trim().toUpperCase() != 'BSIT-F23-M14') {
                    return 'Invalid Student ID (Use BSIT-F23-M14)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),

              // Field 2: PIN (4650)
              TextFormField(
                controller: _pinController,
                obscureText: _obscurePin,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'PIN',
                  hintText: 'Enter 4-digit PIN',
                  filled: true,
                  fillColor: Colors.teal.shade50,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.teal.shade700,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePin ? Icons.visibility : Icons.visibility_off,
                      color: Colors.teal.shade700,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePin = !_obscurePin;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().length < 4) {
                    return 'PIN must be at least 4 digits';
                  }
                  if (value.trim() != '4650') {
                    return 'Incorrect PIN (Use 4650)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),

              // Buttons: Sign In & Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _handleSignIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration clicked')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // TextButton: Forgot PIN?
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('ID: BSIT-F23-M14 | PIN: 4650')),
                  );
                },
                child: const Text(
                  'Forgot PIN?',
                  style: TextStyle(fontSize: 15),
                ),
              ),

              // Returned Text after Sign Out
              if (_statusMessage.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(
                  _statusMessage,
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
