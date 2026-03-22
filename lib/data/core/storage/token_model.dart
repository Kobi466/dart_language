class TokenModel {
  final String accessToken;
  final String refreshToken;
  final DateTime refreshExpiresAt;
  final DateTime accessExpiresAt;

  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.accessExpiresAt,
    required this.refreshExpiresAt,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      accessExpiresAt: DateTime.parse(json['accessExpiresAt']),
      refreshExpiresAt: DateTime.parse(json['refreshExpiresAt']),
    );
  }
}
