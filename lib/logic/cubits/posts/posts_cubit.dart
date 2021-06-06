import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_api/data/models/post.dart';
import 'package:flutter_api/data/repositories/post_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());


  getPosts() async{

    var postsList = await PostRepository().fetchPosts();

  }

}
