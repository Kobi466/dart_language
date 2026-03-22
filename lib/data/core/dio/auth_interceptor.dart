import 'dart:async';

import 'package:dio/dio.dart';
import 'package:first_app/data/core/dio/dio_client.dart';
import 'package:first_app/data/core/storage/token_service.dart';
import 'package:first_app/data/core/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await TokenStorage.getAccessToken();
    if (token != null) {
      if (await TokenStorage.isAccessTokenExpired()) {
        await _refreshTokenMutex();
      }
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  Future<void> _refreshTokenMutex() async {
    if (_isRefreshing) {
      //wait for refresh token to complete
      await _refreshCompleter!.future;
      return;
    }
    //start refresh token
    _isRefreshing = true;
    _refreshCompleter = Completer<void>();
    try {
      await TokenService.refreshToken();
      _refreshCompleter!.complete();
    } catch (e) {
      _refreshCompleter!.completeError(e);
    } finally {
      _isRefreshing = false;
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await _refreshTokenMutex();
      final accessToken = await TokenStorage.getAccessToken();
      if (accessToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
        return handler.resolve(await DioClient.dio.fetch(err.requestOptions));
      }
    }
    super.onError(err, handler);
  }
}
