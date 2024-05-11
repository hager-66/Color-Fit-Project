import 'package:color_fit1/constants.dart';
import 'package:color_fit1/pages/match_outfits_M_Page.dart';
import 'package:color_fit1/pages/match_outfits_w_Page.dart';
import 'package:color_fit1/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class MatchoutfittsPage extends StatelessWidget {
  const MatchoutfittsPage({super.key});

  static String id = 'Matchoutfitts';
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
            const CircleAvatar(
              radius: 140,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                radius: 137,
                backgroundImage: AssetImage('assets/images/match_outfit.jpeg'),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Match outfits',
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
              text: 'Women',
              onTap: () {
                Navigator.pushNamed(context, match_outfitsWPage.id);
              },
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButon(
              s,
              text: 'men',
              onTap: () {
                Navigator.pushNamed(context, match_outfitsmPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
