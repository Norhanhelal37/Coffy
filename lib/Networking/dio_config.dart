import 'package:coffy/Networking/constants.dart';
import 'package:dio/dio.dart';


class DioConfig {
  DioConfig._();

  static Dio? _dio;

  static final _timeout =  Duration(seconds: 20);
  static Dio getDio() {
    _dio ??= Dio()
      ..options.baseUrl = baseUrl
      ..options.receiveTimeout = _timeout
      ..options.connectTimeout = _timeout
      ..interceptors.add(
          LogInterceptor(requestHeader: true, requestBody: true, error: true,responseBody: true));

    

    return _dio!;
  }
}