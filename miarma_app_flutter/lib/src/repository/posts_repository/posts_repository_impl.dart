import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:miarma_app_flutter/src/models/posts/create_post_dto.dart';

import 'package:miarma_app_flutter/src/repository/posts_repository/post_repository.dart';

import '../../../utils/shared_preferences.dart';
import '../../models/posts/get_post_dto.dart';
import '../constants.dart';

class PostRepositoryImpl extends PostRepository {
  final Client _client = Client();

  @override
  Future<List<GetPostDTO>> fetchPublicPosts(String type) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${PreferenceUtils.getString(Constants.token)}'
    };

    final response = await _client.get(
      Uri.parse('${Constants.apiBaseUrl}/posts/$type'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return GetPostDTOResponse.fromJson(json.decode(response.body)).content;
    } else {
      throw Exception('No se han podido cargar los posts');
    }
  }

  @override
  Future<GetPostDTO> createPosts(CreatePostDTO dto, String path) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${PreferenceUtils.getString(Constants.token)}',
      'Accept': 'application/json; charset=UTF-8'
    };

    final uri = Uri.parse('${Constants.apiBaseUrl}/posts/');

    final body = jsonEncode({
      'titulo': dto.titulo,
      'urlFoto': "",
      'urlFoto2': "",
      'texto': dto.texto,
      'visibilidad': dto.visibilidad,
    });

    final request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromString('createPostDTO', body,
          contentType: MediaType('application', 'json')))
      ..files.add(await http.MultipartFile.fromPath('file', path,
          contentType: MediaType('image', 'jpg')))
      ..headers.addAll(headers);

    final res = await request.send();

    final responded = await http.Response.fromStream(res);
    print(responded.body);

    if (res.statusCode == 201) {
      return GetPostDTO.fromJson(json.decode(responded.body));
    } else {
      throw Exception('Fail to create this post');
    }
  }
}
