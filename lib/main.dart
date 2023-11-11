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
        body: Column(
          children: [
            const Text(
              'You need to answer a few questions',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            ElevatedButton(
                onPressed: (){

                },
                child: const Text(
                    'You have chosen answer 1',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
            ),
            ElevatedButton(
              onPressed: (){

              },
              child: const Text('You have chosen answer 2',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){

              },
              child: const Text('You have chosen answer 3',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
