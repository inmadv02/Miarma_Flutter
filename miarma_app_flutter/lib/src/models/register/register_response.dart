class RegisterResponse {
  RegisterResponse({
    required this.id,
    required this.nickname,
    required this.descripcion,
    required this.foto,
    required this.publicaciones,
    required this.numeroSeguidores,
    required this.numeroSiguiendo,
    required this.visibilidad,
  });
  late final String id;
  late final String nickname;
  late final String descripcion;
  late final String foto;
  late final List<dynamic> publicaciones;
  late final int numeroSeguidores;
  late final int numeroSiguiendo;
  late final String visibilidad;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    descripcion = json['descripcion'];
    foto = json['foto'];
    publicaciones = List.castFrom<dynamic, dynamic>(json['publicaciones']);
    numeroSeguidores = json['numeroSeguidores'];
    numeroSiguiendo = json['numeroSiguiendo'];
    visibilidad = json['visibilidad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nickname'] = nickname;
    _data['descripcion'] = descripcion;
    _data['foto'] = foto;
    _data['publicaciones'] = publicaciones;
    _data['numeroSeguidores'] = numeroSeguidores;
    _data['numeroSiguiendo'] = numeroSiguiendo;
    _data['visibilidad'] = visibilidad;
    return _data;
  }
}
