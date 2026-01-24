import 'package:dio/dio.dart';
import 'package:first_app/data/api/dio_client.dart';

class AuthApi {
  final Dio _dio = DioClient.dio;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      "/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );
    return response.data;
  }
}