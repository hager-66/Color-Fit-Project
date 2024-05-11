import 'package:color_fit1/constants.dart';
import 'package:color_fit1/pages/login_page.dart';
import 'package:color_fit1/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //static String id = 'homePage';
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
              radius: 150,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                radius: 146,
                backgroundImage: AssetImage('assets/images/Home.jpeg'),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    'Welcome To ColorFit',
                    style: TextStyle(
                      color: Color.fromARGB(255, 20, 20, 20),
                      fontSize: 25,
                      //fontFamily: 'PoetsenOne',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 1,
              indent: 20,
              endIndent: 20,
              height: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButon(
              s,
              text: 'LOGIN',
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
