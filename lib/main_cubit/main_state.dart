part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}


final class NewPostImagePickedSuccessState extends MainState {}

final class NewPostImagePickedErrorState extends MainState {}

final class LoginPostPhotoForDetectColor extends MainState {}

final class SuccessPostPhotoForDetectColor extends MainState {
  final dynamic data;

  SuccessPostPhotoForDetectColor({
    required this.data,
  });
}

final class ErrorPostPhotoForDetectColor extends MainState {}