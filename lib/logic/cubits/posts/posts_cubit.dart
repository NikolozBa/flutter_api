import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_api/data/models/post.dart';
import 'package:flutter_api/data/repositories/post_repository.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());


  getPosts() async{

    try{
      var postsList = await PostRepository().fetchPosts();
      emit(PostsLoaded(postsList));
    }catch(e){
      emit(PostsError("Unfortunately we were unable to load posts, check your connection"));
    }

  }

}
