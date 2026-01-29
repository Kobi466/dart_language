import 'package:first_app/data/core/dio/dio_client.dart';
import 'package:first_app/data/core/storage/token_storage.dart';

class TokenService {
  static Future<void> refreshToken() async {
    final res = await DioClient.dio.post(
      "/auth/refresh",
      data: {"refreshToken": await TokenStorage.getRefreshToken()},
    );

    final data = res.data['data'];
    await TokenStorage.saveToken(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
      accessExpiresAt: DateTime.parse(data['accessExpiresAt']),
      refreshExpiresAt: DateTime.parse(data['refreshExpiresAt']),
    );
  }
}
