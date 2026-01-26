import 'package:first_app/data/api/auth_api.dart';
import 'package:first_app/data/api/profile_api.dart';
import 'package:first_app/data/models/auth_model.dart';
import 'package:first_app/data/models/profile_model.dart';
import 'package:first_app/data/models/token_model.dart';
import 'package:first_app/data/storage/token_storage.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  final AuthApi _authApi = AuthApi();
  final ProfileApi _profileApi = ProfileApi();


  UserModel? user;
  TokenModel? token;
  ProfileModel? profile;

  bool isLoading = false;

  String? error;

  Future<void> login(String email, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _authApi.login(
          email: email,
          password: password
      );
      // Parse response
      user = UserModel.fromJson(response['data']['user']);
      token = TokenModel.fromJson(response['data']['token']);
      // Save token to storage
      await TokenStorage.saveToken(
          accessToken: token!.accessToken,
          refreshToken: token!.refreshToken
      );

      profile = await _profileApi.getProfile();
      notifyListeners();
    } catch (e){
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAuth() async {
    final accessToken = await TokenStorage.getAccessToken();
    final refreshToken = await TokenStorage.getRefreshToken();

    if (accessToken != null && refreshToken != null) {
      token = TokenModel(
          accessToken: accessToken,
          refreshToken: refreshToken
      );
      notifyListeners();
    }
    try{
      profile = await _profileApi.getProfile();
    }catch(e){
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
  bool get hasProfile => profile != null;
}