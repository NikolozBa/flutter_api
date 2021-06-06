import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api/data/models/post.dart';

class PostRepository extends ChangeNotifier{


  Future<List<Post>> fetchPosts()  async{
    final response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    var loadedPosts = <Post>[];

    if (response.statusCode == 200) {

      for(var item in response.data) {
        loadedPosts.add(Post(item["userId"], item["id"], item["title"], item["body"]));
      }

    }
    return loadedPosts;
  }

}