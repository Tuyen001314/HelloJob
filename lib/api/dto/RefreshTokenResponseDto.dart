class RefreshTokenResponseDto {
  String? accessToken;
  String? message;

  RefreshTokenResponseDto({this.accessToken, this.message});

  RefreshTokenResponseDto.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['message'] = this.message;
    return data;
  }
}
