import 'package:color_fit1/constants.dart';
import 'package:color_fit1/pages/Upload_picture_page.dart';
import 'package:color_fit1/pages/test_page.dart';
import 'package:color_fit1/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  static String id = 'ChoosePage';
  String get s => 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        //mainAxisAlignment: MainAxisAlignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 80),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/Test.jpeg',
              height: 200,
            ),
            const SizedBox(
              height: 45,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'what would you like to do?',
                  style: TextStyle(
                    fontSize: 15,
                    color: kPrimaryColor,
                    fontFamily: 'pacifico',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButon(
              s,
              text: 'take color blindness test',
              onTap: () {
                Navigator.pushNamed(context, TestPage.id);
              },
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButon(
              s,
              text: 'detect color',
              onTap: () {
                Navigator.pushNamed(context, UploadpicturePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
