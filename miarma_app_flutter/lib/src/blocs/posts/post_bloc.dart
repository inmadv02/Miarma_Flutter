import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:miarma_app_flutter/src/models/posts/create_post_dto.dart';

import 'package:miarma_app_flutter/src/repository/posts_repository/post_repository.dart';

import '../../models/posts/get_post_dto.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<FetchPostsWithType>(_postsFetched);
    on<CreatePostsEvent>(_postCreated);
  }

  void _postsFetched(FetchPostsWithType event, Emitter<PostState> emit) async {
    try {
      final posts = await postRepository.fetchPublicPosts(event.type);
      emit(PublicPostsFetched(posts, event.type));
      return;
    } on Exception catch (e) {
      emit(PublicPostsFetchError(e.toString()));
    }
  }

  void _postCreated(CreatePostsEvent event, Emitter<PostState> emit) async {
    try {
      final post =
          await postRepository.createPosts(event.createPostDTO, event.path);
      emit(PostCreated(post));
      return;
    } on Exception catch (e) {
      emit(PostCreatedError(e.toString()));
    }
  }
}
