
import 'package:flutter/material.dart';

void main() {
  runApp(const TestPage());
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});
  static String id = 'TestPage';
  //String get s => 'login';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ishihara Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IshiharaTestPage(),
    );
  }
}

class IshiharaTestPage extends StatefulWidget {
  const IshiharaTestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IshiharaTestPageState createState() => _IshiharaTestPageState();
}

class _IshiharaTestPageState extends State<IshiharaTestPage> {
  int _currentImageIndex = 0;
  final List<String> _ishiharaImages = [
    'assets/test_images/ishihara_1.jpeg',
    'assets/test_images/ishihara_2.jpeg',
    'assets/test_images/ishihara_3.jpeg',
    'assets/test_images/ishihara_4.jpeg',
    'assets/test_images/ishihara_5.jpeg',
    'assets/test_images/ishihara_6.jpeg',
    'assets/test_images/ishihara_7.jpeg',
    'assets/test_images/ishihara_8.jpeg',
    'assets/test_images/ishihara_9.jpeg',
    'assets/test_images/ishihara_10.jpeg',
    'assets/test_images/ishihara_11.jpeg',
    'assets/test_images/ishihara_12.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _ishiharaImages[_currentImageIndex],
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _nextQuestion(true),
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () => _nextQuestion(false),
                  child: const Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _nextQuestion(bool userAnswer) {
    setState(() {
      if (_currentImageIndex < _ishiharaImages.length - 1) {
        // You can handle the user's answer here, e.g., check it against the correct answer
        // and update the score or provide feedback

        _currentImageIndex++;
      } else {
        // This is the last question, you may want to navigate to the result screen
        // or show the result in a dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Test Completed'),
              content: const Text('You have completed the Ishihara Test.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // You can navigate to a new screen here if needed
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}