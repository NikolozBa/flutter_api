import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api/data/models/post.dart';

class PostRepository extends ChangeNotifier{
  List<Post> posts = [];


  fetchPosts()  async{
    final response = await Dio().get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      var loadedPosts = <Post>[];

      for(var item in response.data) {
        loadedPosts.add(Post(item["userId"], item["id"], item["title"], item["body"]));
      };

      posts = loadedPosts;
      notifyListeners();
    }

  }

  PostRepository(){
    fetchPosts();
  }

}