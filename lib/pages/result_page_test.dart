import 'package:flutter/cupertino.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(testIndex < 3)
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/test2.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                /* child: Image.asset(
                'assets/images/gg.jpg',
              width: 300,
              height: 300,),*/
              ),
            if (testIndex >= 3 && testIndex <= 7)
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/test1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                /* child: Image.asset(
                'assets/images/gg.jpg',
              width: 300,
              height: 300,),*/
              ),
            if (testIndex >= 8 && testIndex <= 10)
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/test1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                /* child: Image.asset(
                'assets/images/gg.jpg',
              width: 300,
              height: 300,),*/
              ),
            if (testIndex >= 11 && testIndex <= 12)
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/test1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                /* child: Image.asset(
                'assets/images/gg.jpg',
              width: 300,
              height: 300,),*/
              ),

            const SizedBox(height: 10,),

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
                color: Colors.purple,
              ),
              ),

            if (testIndex >= 3 && testIndex <= 7)
              const Text('Moderate Color Vision Deficiency',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              ),

            if (testIndex >= 8 && testIndex <= 10)
              const Text('Mild Color Vision Deficiency',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              ),

            if (testIndex >= 11 && testIndex <= 12)
              const Text('Normal Color Vision',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,),
              ),

          ],
        ),
      )
    );
  }
}
