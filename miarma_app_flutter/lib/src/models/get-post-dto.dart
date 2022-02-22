class GetPostDTOResponse {
  GetPostDTOResponse({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalElements,
    required this.totalPages,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });
  late final List<GetPostDTO> content;
  late final Pageable pageable;
  late final bool last;
  late final int totalElements;
  late final int totalPages;
  late final int size;
  late final int number;
  late final Sort sort;
  late final bool first;
  late final int numberOfElements;
  late final bool empty;

  GetPostDTOResponse.fromJson(Map<String, dynamic> json) {
    content =
        List.from(json['content']).map((e) => GetPostDTO.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    size = json['size'];
    number = json['number'];
    sort = Sort.fromJson(json['sort']);
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e) => e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    _data['last'] = last;
    _data['totalElements'] = totalElements;
    _data['totalPages'] = totalPages;
    _data['size'] = size;
    _data['number'] = number;
    _data['sort'] = sort.toJson();
    _data['first'] = first;
    _data['numberOfElements'] = numberOfElements;
    _data['empty'] = empty;
    return _data;
  }
}

class GetPostDTO {
  GetPostDTO(
      {required this.id,
      required this.titulo,
      required this.texto,
      required this.urlFoto1,
      required this.urlFoto2,
      required this.visibilidad,
      required this.nickname,
      required this.fotoPerfil,
      required this.likes});
  late final int id;
  late final String titulo;
  late final String texto;
  late final String urlFoto1;
  late final String urlFoto2;
  late final String nickname;
  late final String visibilidad;
  late final String fotoPerfil;
  late final int likes;

  GetPostDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
    urlFoto1 = json['urlFoto1'];
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
    _data['urlFoto1'] = urlFoto1;
    _data['urlFoto2'] = urlFoto2;
    _data['visibilidad'] = visibilidad;
    _data['nickname'] = nickname;
    _data['fotoPerfil'] = fotoPerfil;
    _data['likes'] = likes;
    return _data;
  }
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.unpaged,
    required this.paged,
  });
  late final Sort sort;
  late final int offset;
  late final int pageNumber;
  late final int pageSize;
  late final bool unpaged;
  late final bool paged;

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = Sort.fromJson(json['sort']);
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sort'] = sort.toJson();
    _data['offset'] = offset;
    _data['pageNumber'] = pageNumber;
    _data['pageSize'] = pageSize;
    _data['unpaged'] = unpaged;
    _data['paged'] = paged;
    return _data;
  }
}

class Sort {
  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });
  late final bool empty;
  late final bool sorted;
  late final bool unsorted;

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['empty'] = empty;
    _data['sorted'] = sorted;
    _data['unsorted'] = unsorted;
    return _data;
  }
}
