import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

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
      print(value.data);
      emit(SuccessPostPhotoForDetectColor(
        data: value.data,
      ));
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response!.data['message']);
        print(onError.message);
        emit(ErrorPostPhotoForDetectColor());
      }
    });
  }
}
