import 'package:color_fit1/firebase_options.dart';
import 'package:color_fit1/main_cubit/main_cubit.dart';
import 'package:color_fit1/pages/match_outfits_M_Page.dart';
import 'package:color_fit1/pages/Upload_picture_page.dart';
import 'package:color_fit1/pages/match_outfits_w_Page.dart';
import 'package:color_fit1/pages/choose_page.dart';
import 'package:color_fit1/pages/home_page.dart';
import 'package:color_fit1/pages/login_page.dart';
import 'package:color_fit1/pages/match_outfits_page.dart';
import 'package:color_fit1/pages/result_photo_detect.dart';

//import 'package:color_fit1/pages/t.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_fit1/pages/test_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:color_fit1/pages/register_page.dart';

import 'bloc_observer.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await DioHelper.inti();
  runApp(const ColorFitApp());
}

// ignore: must_be_immutable
class ColorFitApp extends StatelessWidget {
  const ColorFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              LoginPage.id: (context) => const LoginPage(),
              RegisterPage.id: (context) => const RegisterPage(),
              TestPage.id: (context) => const TestPage(),
              ChoosePage.id: (context) => const ChoosePage(),
              UploadpicturePage.id: (context) => const UploadpicturePage(),
              MatchoutfittsPage.id: (context) => const MatchoutfittsPage(),
              match_outfitsWPage.id: (context) => const match_outfitsWPage(),
              match_outfitsmPage.id: (context) => const match_outfitsmPage(),

            },
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
