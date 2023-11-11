import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Test Your Personality...',
            style: TextStyle(
              fontSize: 36,
            ),
          ),
          backgroundColor: const Color(0x0000007d),
        ),
        body: const Column(
          children: [
            Text(
              'You need to answer a few questions',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
