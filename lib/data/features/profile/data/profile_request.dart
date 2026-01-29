class UpdateProfileRequest {
  final String fullName;
  final String? about;
  final String? personalWebsite;
  final String? github;
  final String? linkedin;
  final String? facebook;
  final String? youtube;

  UpdateProfileRequest({
    required this.fullName,
    this.about,
    this.personalWebsite,
    this.github,
    this.linkedin,
    this.facebook,
    this.youtube,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'about': about,
      'personalWebsite': personalWebsite,
      'github': github,
      'linkedin': linkedin,
      'facebook': facebook,
      'youtube': youtube,
    };
  }
}