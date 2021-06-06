import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_api/data/models/comment.dart';
import 'package:flutter_api/data/repositories/comment_repository.dart';
part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());


  getComments(int postId) async{

    try{
      var commentList = await CommentRepository().fetchComments(postId);
      emit(CommentsLoaded(commentList));
    }catch(e){
      emit(CommentsError("Unfortunately we were unable to load comments, check your connection"));
    }
  }

  wipeData(){
    emit(CommentsInitial());
  }

}
