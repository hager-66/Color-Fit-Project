import 'package:dio/dio.dart';


class DioHelper
{
  static late Dio dio ;

  static inti()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://pythons.codepeak.live/',
        receiveDataWhenStatusError: true,
      ),
    );
  }



  static Future<Response> getDate({
  required String url,
   Map<String,dynamic>? query ,
  }) async
  {
    return await dio.get(
      url ,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query ,
    required dynamic data ,
  }) async
  {

     return dio.post(
       url ,
       queryParameters: query,
       data: data,
     );
  }

}