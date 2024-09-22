import 'package:dio/dio.dart';
import 'api_constance.dart';
import 'dio_interseptor.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    _init();
  }

  void _init() {
    dio.options = BaseOptions(
      baseUrl: ApiConstance.baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio.interceptors.add(MyDioInterceptor());
  }

  Future<Response> getData(
      {required String endPoint, String lang = 'ar'}) async {
    dio.options.headers = {
      'Accept-Language': lang,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'api-key': ApiConstance.apiKey
    };
    Response response = await dio.get(endPoint);
    return response;
  }
}
