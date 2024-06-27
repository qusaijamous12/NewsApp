import 'package:dio/dio.dart';

class DioHelper{
  static Dio ?dio;
  static Init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true
      )
    );
  }


  static Future<Response> GetData({
    required String Path,
    required Map<String,dynamic> query
}) async{
    return await dio!.get(
      Path,
      queryParameters: query
    );
  }
}

//https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=7857d908aca74a29ac0f3d7059d58e25