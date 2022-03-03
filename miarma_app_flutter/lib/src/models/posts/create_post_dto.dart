class CreatePostDTO {
  CreatePostDTO({
    required this.titulo,
    required this.texto,
    required this.urlFoto,
    required this.urlFoto2,
    required this.visibilidad,
  });

  late final String titulo;
  late final String texto;
  late final String urlFoto;
  late final String urlFoto2;
  late final String visibilidad;

  CreatePostDTO.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    texto = json['texto'];
    urlFoto = json['urlFoto'];
    urlFoto2 = json['urlFoto2'];
    visibilidad = json['visibilidad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['titulo'] = titulo;
    _data['texto'] = texto;
    _data['urlFoto'] = urlFoto;
    _data['urlFoto2'] = urlFoto2;
    _data['visibilidad'] = visibilidad;
    return _data;
  }
}
