import 'package:dio/dio.dart';
import 'package:first_app/data/core/dio/dio_client.dart';

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

  Future<void> logout(String accessToken) async {
    await _dio.post(
      "/auth/logout",
      // options: Options(
      //   headers: {
      //     "Authorization": "Bearer $accessToken",
      //   },
      // ),
      data: {
        "accessToken": accessToken
      }
    );
  }
  
}