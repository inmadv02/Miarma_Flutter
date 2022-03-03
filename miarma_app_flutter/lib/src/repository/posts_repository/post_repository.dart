import 'package:miarma_app_flutter/src/models/posts/create_post_dto.dart';

import '../../models/posts/get_post_dto.dart';

abstract class PostRepository {
  Future<List<GetPostDTO>> fetchPublicPosts(String type);

  Future<GetPostDTO> createPosts(CreatePostDTO postDTO, String path);
}
