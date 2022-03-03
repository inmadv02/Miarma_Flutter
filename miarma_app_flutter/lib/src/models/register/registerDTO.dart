class RegisterDTO {
  RegisterDTO({
    required this.nickname,
    required this.avatar,
    required this.fullname,
    required this.fechaNacimiento,
    required this.email,
    required this.password,
    required this.password2,
    required this.visibilidad,
  });
  late final String nickname;
  late final String avatar;
  late final String fullname;
  late final DateTime fechaNacimiento;
  late final String email;
  late final String password;
  late final String password2;
  late final String visibilidad;

  RegisterDTO.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    avatar = json['avatar'];
    fullname = json['fullname'];
    fechaNacimiento = json['fechaNacimiento'];
    email = json['email'];
    password = json['password'];
    password2 = json['password2'];
    visibilidad = json['visibilidad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nickname'] = nickname;
    _data['avatar'] = avatar;
    _data['fullname'] = fullname;
    _data['fechaNacimiento'] = fechaNacimiento;
    _data['email'] = email;
    _data['password'] = password;
    _data['password2'] = password2;
    _data['visibilidad'] = visibilidad;
    return _data;
  }
}
