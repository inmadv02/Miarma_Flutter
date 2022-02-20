class GetPostDTO {
  GetPostDTO({
    required this.id,
    required this.titulo,
    required this.texto,
    required this.urlFoto,
    required this.urlFoto2,
    required this.visibilidad,
    required this.nickname,
    required this.fotoPerfil,
    required this.likes,
  });
  late final int id;
  late final String titulo;
  late final String texto;
  late final String urlFoto;
  late final String urlFoto2;
  late final String visibilidad;
  late final String nickname;
  late final String fotoPerfil;
  late final int likes;

  GetPostDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
    urlFoto = json['urlFoto'];
    urlFoto2 = json['urlFoto2'];
    visibilidad = json['visibilidad'];
    nickname = json['nickname'];
    fotoPerfil = json['fotoPerfil'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['titulo'] = titulo;
    _data['texto'] = texto;
    _data['urlFoto'] = urlFoto;
    _data['urlFoto2'] = urlFoto2;
    _data['visibilidad'] = visibilidad;
    _data['nickname'] = nickname;
    _data['fotoPerfil'] = fotoPerfil;
    _data['likes'] = likes;
    return _data;
  }
}
