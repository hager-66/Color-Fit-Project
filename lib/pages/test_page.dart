import 'package:flutter/material.dart';

import 'result_page_test.dart';

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

  int testIndex = 0 ;
  dynamic valueOne = '0';
  dynamic valueTwo  = '0';
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
              /*   width: 300,
              height: 200,
              fit: BoxFit.cover,*/
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const Text(
                  'What the first number  do you see in the image?',
                  style: TextStyle(fontSize: 15),
                ),
                DropdownButton<String>(
                  hint: const Text('Select a number'),
                  value: valueOne,
                  items: <String>['0','1', '2', '3', '4', '5', '6', '7', '8', '9']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (s) {
                    setState(() {
                      valueOne = s ;
                    });
                  },
                ),

                if (_currentImageIndex != 1 && _currentImageIndex != 3 && _currentImageIndex != 5
                    && _currentImageIndex != 7 && _currentImageIndex != 9 && _currentImageIndex != 11)
                const Text(
                  'What the second number do you see in the image?',
                  style: TextStyle(fontSize: 15),
                ),
                if (_currentImageIndex != 1 && _currentImageIndex != 3 && _currentImageIndex != 5
                    && _currentImageIndex != 7 && _currentImageIndex != 9 && _currentImageIndex != 11)
                DropdownButton<String>(
                  hint: const Text('Select a number'),
                  value: valueTwo,
                  items: <String>['0','1', '2', '3', '4', '5', '6', '7', '8', '9']
                      .map((newValue) {
                    return DropdownMenuItem<String>(
                      value: newValue,
                      child: Text(newValue),
                    );
                  }).toList(),
                  onChanged: (newValueS) {
                    setState(() {
                      valueTwo = newValueS ;
                    });
                  },
                ),

              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _nextQuestion(true),
                  child: const Text('Next'),
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

        // _currentImageIndex++;
      if(_currentImageIndex == 0) {
        if (valueOne == '7' && valueTwo == '4') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 1) {
        if (valueOne == '6' && valueTwo == '0') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 2) {
        if (valueOne == '1' && valueTwo == '6') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 3) {
        if (valueOne == '2' && valueTwo == '0') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 4) {
        if (valueOne == '2' && valueTwo == '9') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 5) {
        if (valueOne == '7' && valueTwo == '0') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 6) {
        if (valueOne == '4' && valueTwo == '5') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 7) {
        if (valueOne == '5' && valueTwo == '0') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 8) {
        if (valueOne == '9' && valueTwo == '7') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 9) {
        if (valueOne == '8' && valueTwo == '0') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 10) {
        if (valueOne == '4' && valueTwo == '2') {
          testIndex++;
        }
        _currentImageIndex++;
      }
      else if(_currentImageIndex == 11) {
        if (valueOne == '3' && valueTwo == '0') {
          testIndex++;
        }
        _currentImageIndex++;
      }

        valueOne = '0';
        valueTwo = '0';
      } else {
        // This is the last question, you may want to navigate to the result screen
        // or show the result in a dialog
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPageTest(testIndex: testIndex),
          ),
        );
     /*   showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Test Completed'),
              content: const Text('You have completed the Ishihara Test.'),
              actions: [
                TextButton(
                  onPressed: () {
                    print(testIndex);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );*/
      }
    });
  }
}
