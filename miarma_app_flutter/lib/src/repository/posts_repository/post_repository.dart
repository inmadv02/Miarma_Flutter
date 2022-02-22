import 'package:miarma_app_flutter/src/models/get-post-dto.dart';

abstract class PostRepository {
  Future<List<GetPostDTO>> fetchPublicPosts(String type);
}
