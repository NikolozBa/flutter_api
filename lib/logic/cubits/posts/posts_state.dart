part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

class PostsInitial extends PostsState {
  @override
  List<Object> get props => [];
}

class PostsLoaded extends PostsState{
  final List<Post> posts;

  PostsLoaded(this.posts);

  @override
  List<Object> get props => [posts];

}


class PostsError extends PostsState {
  final String errprMessage;

  PostsError(this.errprMessage);

  @override
  List<Object> get props => [errprMessage];

}