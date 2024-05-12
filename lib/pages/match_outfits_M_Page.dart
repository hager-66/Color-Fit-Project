import 'package:color_fit1/constants.dart';
import 'package:color_fit1/pages/result_page_outfits.dart';
import 'package:color_fit1/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../main_cubit/main_cubit.dart';

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
            Row(
              children: [
                Expanded(
                  child: CustomButon(
                    s,
                    text: 'T-Shirts',
                    onTap: () {
                      MainCubit.get(context)
                          .readJson(context: context,
                          gender: 'men',
                          type: 't-shirts')
                          .then((value) {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const ResultPageOutfits(
                                  outfits: 't-shirts',
                                )));
                      });
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: CustomButon(
                    s,
                    text: 'Pants',
                    onTap: () {
                      MainCubit.get(context)
                          .readJson(context: context,
                          gender: 'men',
                          type: 'pants')
                          .then((value) {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const ResultPageOutfits(
                                  outfits: 'pants',
                                )));
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButon(
                    s,
                    text: 'Sweatshirts',
                    onTap: () {
                      MainCubit.get(context)
                          .readJson(context: context,
                          gender: 'men',
                          type: 'sweatshirts')
                          .then((value) {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const ResultPageOutfits(
                                  outfits: 'sweatshirts',
                                )));
                      });
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: CustomButon(
                    s,
                    text: 'jackets',
                    onTap: () {
                      MainCubit.get(context)
                          .readJson(context: context,
                          gender: 'men',
                          type: 'jackets')
                          .then((value) {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const ResultPageOutfits(
                                  outfits: 'jackets',
                                )));
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
