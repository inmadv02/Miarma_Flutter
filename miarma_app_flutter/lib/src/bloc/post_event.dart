part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();
}

class FetchPostsWithType extends PostEvent {
  final String type;

  const FetchPostsWithType(this.type);

  @override
  List<Object?> get props => [type];
}
