import 'package:color_fit1/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'match_outfits_page.dart';

class UploadpicturePage extends StatelessWidget {
  const UploadpicturePage({super.key});

  static String id = 'UploadpicturePage';
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
              'assets/images/upload_picture.jpeg',
              height: 400,
            ),
            CustomButon(
              s,
              text: 'Upload picture',
              onTap: () {
                Navigator.pushNamed(context, MatchoutfittsPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
