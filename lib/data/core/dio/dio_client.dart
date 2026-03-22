import 'package:dio/dio.dart';
import 'package:first_app/data/core/dio/auth_interceptor.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8080/project",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    )
  );

  static void setUpInterceptors(){
    DioClient.dio.interceptors.add(
      // InterceptorsWrapper(
      //   onRequest: (options, handler) async {
      //     final accessToken = await TokenStorage.getAccessToken();
      //     if (accessToken != null) {
      //       if(await TokenStorage.isAccessTokenExpired()){
      //         await TokenService.refreshToken();
      //       }
      //       options.headers['Authorization'] = 'Bearer $accessToken';
      //     }
      //     return handler.next(options);
      //   },
      //   onError: (error, handler) async {
      //     if (error.response?.statusCode == 401) {
      //       await TokenService.refreshToken();
      //       final accessToken = await TokenStorage.getAccessToken();
      //       if (accessToken != null) {
      //         error.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
      //         return handler.resolve(await DioClient.dio.fetch(error.requestOptions));
      //       }
      //     }
      //     return handler.next(error);
      //   },
      // ),
      AuthInterceptor(),
    );
  }
}