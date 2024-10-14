import 'package:flutter/material.dart';

class PasswordTypingScreen extends StatelessWidget {
  final int filledDots;

  const PasswordTypingScreen({super.key, this.filledDots = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hello, Romina!!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Type your password',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  6, (index) => _buildPasswordDot(index < filledDots)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordDot(bool filled) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(
        filled ? Icons.circle : Icons.circle_outlined,
        color: filled ? Colors.blue : Colors.grey,
        size: 20,
      ),
    );
  }
}
