import 'package:flutter/material.dart';
import 'package:flutter_api/data/repositories/comment_repository.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  static const routeName = "/comments-screen";

  const CommentsScreen({Key key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context).settings.arguments;
    Provider.of<CommentRepository>(context, listen: false).fetchComments(postId);

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CommentRepository>(
        builder: (context, dataObj, child){

          return ListView.builder(
            itemCount: Provider.of<CommentRepository>(context, listen: false).comments.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  Container(

                      child: Text(Provider.of<CommentRepository>(context, listen: false).comments[index].name),
                      padding: EdgeInsets.all(20)
                  )

                ],
              );
            },
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
