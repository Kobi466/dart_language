import 'package:first_app/data/api/auth_api.dart';
import 'package:first_app/data/models/auth_model.dart';
import 'package:first_app/data/models/token_model.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
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
      final response = await _authApi.login(
          email: email,
          password: password
      );
      user = UserModel.fromJson(response['data']['user']);
      token = TokenModel.fromJson(response['data']['token']);
      print(user);
    } catch (e){
      error = 'login failed';
      print(e);

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool get isLoggedIn => token != null;
}