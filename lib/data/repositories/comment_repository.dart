import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api/data/models/comment.dart';

class CommentRepository extends ChangeNotifier{


  Future<List<Comment>> fetchComments(int postId) async {
    final response = await Dio().get("https://jsonplaceholder.typicode.com/posts/${postId.toString()}/comments");
    var loadedComments = <Comment>[];

    if (response.statusCode == 200) {

      for(var item in response.data) {
        loadedComments.add(Comment(item["postId"], item["id"], item["name"], item["email"], item["body"]));
      }

    }
    return loadedComments;
  }

}