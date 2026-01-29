import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_app/data/core/dio/dio_client.dart';
import 'package:first_app/data/features/profile/data/profile_model.dart';
import 'package:first_app/data/features/profile/data/profile_request.dart';

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

  Future<void> updateProfile({required UpdateProfileRequest request}) async {
    await _dio.put('/profile/update', data: request.toJson());
  }

  Future<String> uploadAvatar({required File file}) async {
    final formData = FormData.fromMap({
      'file' : await MultipartFile.fromFile(file.path)
    });
    final res = await _dio.patch('/profile/upload-avatar', data: formData);
    return res.data["data"]["url"];
  }
}
