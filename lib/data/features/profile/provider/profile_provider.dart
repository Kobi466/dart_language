import 'dart:io';

import 'package:first_app/data/features/profile/data/profile_api.dart';
import 'package:first_app/data/features/profile/data/profile_model.dart';
import 'package:first_app/data/features/profile/data/profile_request.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileApi profileApi = ProfileApi();

  ProfileModel? _profile;

  ProfileModel? get profile => _profile;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _hasLoaded = false;

  bool get hasLoaded => _hasLoaded;

  bool _isUploadingAvatar = false;

  bool get isUploadingAvatar => _isUploadingAvatar;

  Future<void> getProfile() async {
    if (_hasLoaded) {
      return;
    }
    _isLoading = true;
    notifyListeners();
    try {
      _profile = await profileApi.getProfile();
      _hasLoaded = true;
    } catch (e) {
      _profile = null;
      _hasLoaded = true;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile({required UpdateProfileRequest request}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await profileApi.updateProfile(request: request);
    } catch (e) {
      _profile = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> uploadAvatar({required File file}) async {
    _isUploadingAvatar = true;
    notifyListeners();
    try {
      final res = await profileApi.uploadAvatar(file: file);
      _profile = _profile?.copyWith(avatar: res);
      notifyListeners();
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      _isUploadingAvatar = false;
      notifyListeners();
    }
  }

  void clear() {
    _hasLoaded = false;
    _profile = null;
    notifyListeners();
  }
}
