import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:miarma_app_flutter/src/models/get-post-dto.dart';
import 'package:miarma_app_flutter/src/repository/posts_repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
  }

  Future<void> _postsFetched(
      FetchPostsWithType event, Emitter<PostState> emit) async {
    try {
      final posts = await postRepository.fetchPublicPosts(event.type);
      emit(PublicPostsFetched(posts, event.type));
      return;
    } on Exception catch (e) {
      emit(PublicPostsFetchError(e.toString()));
    }
  }
}
