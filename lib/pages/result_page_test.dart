import 'package:flutter/material.dart';

class ResultPageTest extends StatelessWidget {
  const ResultPageTest({super.key, required this.testIndex});

  final int testIndex ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ishihara Test Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your result is: ${testIndex.toString()}',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            if(testIndex < 3)
              const Text('Severe Color Vision Deficiency',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              ),
            if (testIndex >= 3 && testIndex <= 7)
              const Text('Moderate Color Vision Deficiency',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              ),
            if (testIndex >= 8 && testIndex <= 10)
              const Text('Mild Color Vision Deficiency',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
              ),
            if (testIndex >= 11 && testIndex <= 12)
              const Text('Normal Color Vision',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,),
              ),
          ],
        ),
      )
    );
  }
}
