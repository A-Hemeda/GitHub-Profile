import 'package:dio/dio.dart';
import 'package:weather_algoriza/network/api/end_points.dart';

class DioHelper {
  static final DioHelper _instance = DioHelper._internal();

  factory DioHelper() {
    return _instance;
  }

  DioHelper._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: '${EndPoints.baseURL}${EndPoints.version}',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static  Dio? dio;

  static Future<Response> getData({required String url, Map<String, dynamic> quiry = const {}}) async {
   return await  dio!.get(url, queryParameters: quiry);
  }
 

}
