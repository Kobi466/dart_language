import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage{
  static const _accessToken = "accessToken";
  static const _refreshToken = "refreshToken";
  static const _accessExpiresAt = "accessExpiresAt";
  static const _refreshExpiresAt = "refreshExpiresAt";

  static Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
    required DateTime accessExpiresAt,
    required DateTime refreshExpiresAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessToken, accessToken);
    await prefs.setString(_refreshToken, refreshToken);
    await prefs.setString(_accessExpiresAt, accessExpiresAt.toIso8601String());
    await prefs.setString(_refreshExpiresAt, refreshExpiresAt.toIso8601String());
  }

  static Future<bool> isAccessTokenExpired() async {
    final prefs = await SharedPreferences.getInstance();
    final accessTokenExpiresAt = prefs.getString(_accessExpiresAt);
    if (accessTokenExpiresAt == null) {
      return true;
    }
    return DateTime.now().isAfter(DateTime.parse(accessTokenExpiresAt).subtract(const Duration(seconds: 30)));
  }

  static Future<bool> isRefreshTokenExpired() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshTokenExpiresAt = prefs.getString(_refreshExpiresAt);
    if (refreshTokenExpiresAt == null) {
      return true;
    }
    return DateTime.now().isAfter(DateTime.parse(refreshTokenExpiresAt).subtract(const Duration(seconds: 30)));
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessToken);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshToken);
  }

  static Future<String?> getAccessExpiresAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessExpiresAt);
  }

  static Future<String?> getRefreshExpiresAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshExpiresAt);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessToken);
    await prefs.remove(_refreshToken);
    await prefs.remove(_accessExpiresAt);
    await prefs.remove(_refreshExpiresAt);
  }
}