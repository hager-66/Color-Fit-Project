import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../network/remote/dio_helper.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  File? newPostImage;
  var newPicker = ImagePicker();
  Future<void> getNewPostImage(ImageSource imageSource) async {
    final pickedFile = await newPicker.pickImage(source: imageSource);
    if (pickedFile != null) {
      newPostImage = File(pickedFile.path);
      print('New Post Image : ${newPostImage.toString()}');
      emit(NewPostImagePickedSuccessState());
    } else {
      print('No image selected');
      emit(NewPostImagePickedErrorState());
    }
  }

  Future<void> postPhotoForDetectColor({
    required File? photo,
  }) async {
    emit(LoginPostPhotoForDetectColor());

    FormData formData = FormData.fromMap({
        'num_dominant_colors' : 3,
        'num_random_colors' : 3,
        'photo': await MultipartFile.fromFile(photo!.path),

    });
    DioHelper.postData(
      url: 'analyze_colors',
      data: formData,
    ).then((value) {
      emit(SuccessPostPhotoForDetectColor(
        data: value.data,
      ));
    }).catchError((onError) {
      if (onError is DioException) {
        print(onError.response!.data['message']);
        print(onError.message);
        emit(ErrorPostPhotoForDetectColor());
      }
    });
  }


  dynamic dataOutfits;
  Future<void> readJson({required BuildContext context,
  required String gender,required String type,
  }) async {
    final String response = await rootBundle.loadString(
        'assets/clothes/$gender/$type/colors&links($type).json');
    final data = await json.decode(response);
    dataOutfits = data ;
    emit(ReadJson());
  }


  IconData suffix = Icons.visibility_outlined;

  bool isPasswordShown = true;


  void changePasswordVisibility() {
    debugPrint('changePasswordVisibility');
    isPasswordShown = !isPasswordShown;
    suffix =
    isPasswordShown ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }


  IconData suffixRegister = Icons.visibility_outlined;

  bool isPasswordShownRegister = true;


  void changePasswordVisibilityRegister() {
    debugPrint('changePasswordVisibility');
    isPasswordShownRegister = !isPasswordShownRegister;
    suffixRegister =
    isPasswordShownRegister ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityRegisterState());
  }
}
