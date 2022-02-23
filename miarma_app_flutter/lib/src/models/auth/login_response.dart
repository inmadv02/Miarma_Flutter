class LoginResponse {
  LoginResponse({
    required this.token,
    required this.fullname,
    required this.email,
    required this.foto,
  });
  late final String token;
  late final String fullname;
  late final String email;
  late final String foto;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    fullname = json['fullname'];
    email = json['email'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['fullname'] = fullname;
    _data['email'] = email;
    _data['foto'] = foto;

    return _data;
  }
}
