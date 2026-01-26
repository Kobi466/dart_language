class ProfileModel {
  final int id;
  final String fullName;
  final String? about;
  final String? avatar;
  final String? personalWebsite;
  final String? github;
  final String? linkedin;
  final String? facebook;
  final String? youtube;

  ProfileModel({
    required this.id,
    required this.fullName,
    this.about,
    this.avatar,
    this.personalWebsite,
    this.github,
    this.linkedin,
    this.facebook,
    this.youtube,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      fullName: json['fullName'],
      about: json['about'],
      avatar: json['avatar'],
      personalWebsite: json['personalWebsite'],
      github: json['github'],
      linkedin: json['linkedin'],
      facebook: json['facebook'],
      youtube: json['youtube'],
    );
  }
}
