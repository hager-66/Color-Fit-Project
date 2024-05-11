import 'package:color_fit1/constants.dart';
import 'package:color_fit1/widgets/custom_button.dart';
import 'package:color_fit1/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:color_fit1/pages/register_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snack_bar.dart';
import 'choose_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = 'loginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}


// ignore: must_be_immutable
class _LoginPageState extends State<LoginPage> {

  String? email, password;
  String get s => 'Register';
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child:Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 80),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: kPrimaryColor,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/Login.jpeg'),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButon(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.pushNamed(context,ChoosePage.id, arguments: email);
                      }
                      on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          showSnackBar(context, 'user not found');
                        } else if (ex.code == 'wrong-password') {
                          showSnackBar(context, 'wrong password');
                        }
                      } catch (ex) {
                        print(ex);
                        showSnackBar(context, 'there was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  s,
                  text: 'LOGIN',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'dont\'t have an account?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 131, 133, 132),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        '  Register',
                        style: TextStyle(
                          color: Color.fromARGB(255, 131, 133, 132),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

}

