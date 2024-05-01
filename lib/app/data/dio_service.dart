import 'package:dio/dio.dart';

class DioBaseService {
  static late Dio _dio;

  static Future<void> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://openlibrary.org/people/kevin_kiron/books",
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  static Dio get dio {
    return _dio;
  }
}
