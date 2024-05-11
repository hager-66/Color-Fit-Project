import 'package:color_fit1/constants.dart';
import 'package:color_fit1/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class match_outfitsmPage extends StatelessWidget {
  const match_outfitsmPage({super.key});

  static String id = 'match_outfitsformenPage';
  String get s => 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 80),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/men.jpeg',
              height: 300,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Matching outfits for men',
                  style: TextStyle(
                    fontSize: 15,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            CustomButon(
              s,
              text: 'Upload picture',
              onTap: () {
                //Navigator.pushNamed(context, ChoosePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
