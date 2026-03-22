import 'package:first_app/data/core/storage/token_service.dart';
import 'package:first_app/data/features/auth/data/auth_api.dart';
import 'package:first_app/data/features/auth/data/auth_model.dart';
import 'package:first_app/data/core/storage/token_model.dart';
import 'package:first_app/data/core/storage/token_storage.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApi _authApi = AuthApi();

  UserModel? user;
  TokenModel? token;

  bool isLoading = false;

  String? error;

  Future<void> login(String email, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _authApi.login(email: email, password: password);
      // Parse response
      user = UserModel.fromJson(response['data']['user']);
      token = TokenModel.fromJson(response['data']['token']);
      // Save token to storage
      await TokenStorage.saveToken(
        accessToken: token!.accessToken,
        refreshToken: token!.refreshToken,
        accessExpiresAt: token!.accessExpiresAt,
        refreshExpiresAt: token!.refreshExpiresAt,
      );

      notifyListeners();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAuth() async {
    final accessToken = await TokenStorage.getAccessToken();
    final refreshToken = await TokenStorage.getRefreshToken();
    final accessExpiresAt = await TokenStorage.getAccessExpiresAt();
    final refreshExpiresAt = await TokenStorage.getRefreshExpiresAt();

    if (accessToken != null && refreshToken != null) {
      token = TokenModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
        accessExpiresAt: DateTime.parse(accessExpiresAt!),
        refreshExpiresAt: DateTime.parse(refreshExpiresAt!),
      );
    }
    notifyListeners();
    try {
      if (token != null && await TokenStorage.isAccessTokenExpired()) {
        await TokenService.refreshToken();
      }
    } catch (e) {
      await logout();
    }
  }

  Future<void> logout() async {
    try {
      if (token != null) {
        await _authApi.logout(token!.accessToken);
      }
    } on Exception catch (e) {
      error = e.toString();
    }
    token = null;
    user = null;
    await TokenStorage.clearToken();
    notifyListeners();
  }

  bool get isLoggedIn => token != null;
}
