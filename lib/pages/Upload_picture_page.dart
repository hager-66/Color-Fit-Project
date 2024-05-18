import 'package:color_fit1/pages/result_photo_detect.dart';
import 'package:color_fit1/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/selectPhoto.dart';
import '../main_cubit/main_cubit.dart';

class UploadpicturePage extends StatelessWidget {
  const UploadpicturePage({super.key});

  static String id = 'UploadpicturePage';
  String get s => 'login';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
  listener: (context, state) {
    if(state is SuccessPostPhotoForDetectColor) {
      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => ResultPhotoDetect(
              image: MainCubit.get(context).newPostImage,
              data: state.data,
            ),
          ));
    }
  },
  builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: state is LoginPostPhotoForDetectColor ? true : false,
      child: Scaffold(
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
                  _showSelectPhotoOptionsNew(context);
                  // Navigator.pushNamed(context, MatchoutfittsPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
void _showSelectPhotoOptionsNew(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.28,
        maxChildSize: 0.4,
        minChildSize: 0.28,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SelectPhotoOptionsScreen(
              onTap: MainCubit.get(context).getNewPostImage
            ),
          );
        }),
  );
}