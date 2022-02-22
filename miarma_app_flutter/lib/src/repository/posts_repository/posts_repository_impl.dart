import 'dart:convert';

import 'package:http/http.dart';
import 'package:miarma_app_flutter/src/models/get-post-dto.dart';
import 'package:miarma_app_flutter/src/repository/posts_repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final Client _client = Client();

  @override
  Future<List<GetPostDTO>> fetchPublicPosts(String type) async {
    final response =
        await _client.get(Uri.parse('https://localhost:8080/posts$type'));
    if (response.statusCode == 200) {
      return GetPostDTOResponse.fromJson(json.decode(response.body)).content;
    } else {
      throw Exception('No se han podido cargar los posts');
    }
  }
}
