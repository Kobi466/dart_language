import 'package:dio/dio.dart';
import 'package:first_app/data/api/dio_client.dart';
import 'package:first_app/data/models/profile_model.dart';

class ProfileApi {
  final Dio _dio = DioClient.dio;

  Future<ProfileModel> getProfile() async {
    final res = await _dio.get(
      "/profile",
      // queryParameters: {
      //   "userId": userId
      // }
    );
    return ProfileModel.fromJson(res.data["data"]);
  }
}
