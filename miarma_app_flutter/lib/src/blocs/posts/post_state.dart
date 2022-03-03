part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PublicPostsFetched extends PostState {
  final List<GetPostDTO> posts;
  final String type;

  const PublicPostsFetched(this.posts, this.type);

  @override
  List<Object> get props => [posts];
}

class PublicPostsFetchError extends PostState {
  final String message;
  const PublicPostsFetchError(this.message);

  @override
  List<Object> get props => [message];
}

class PostCreated extends PostState {
  final GetPostDTO response;

  const PostCreated(this.response);

  @override
  List<Object> get props => [response];
}

class PostCreatedError extends PostState {
  final String message;
  const PostCreatedError(this.message);

  @override
  List<Object> get props => [message];
}
