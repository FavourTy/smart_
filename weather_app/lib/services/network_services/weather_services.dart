// step1
// setup your dio w your base url

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  static final ApiServices _singleton = ApiServices._internal();

  factory ApiServices() {
    return _singleton;
  }
  ApiServices._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: dotenv.get("base_url"),
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ));

//step 5 add pretty dio loggers for easy terminal output

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));
  }

  late final Dio _dio;
  //methods
  /*To differentiate btwn a successful response and unsuccessful response
  darts records would be used 
  if it is successful return dynamic.data
  if it is not successful return string.error
  Future<({dynamic data, String error})>
   */
  Future<({dynamic data, String? error})> get(
      {required String endpoint}) async {
    try {
      final request = await _dio.get(endpoint);
      final status = request.statusCode ?? 0;
      if (status > 199 && status < 300) {
        return (data: request.data, error: null);
      }
      return (data: null, error: (request.data["message"] ?? "").toString());
    } catch (t) {
      return (data: null, error: t.toString());
    }
  }
}
