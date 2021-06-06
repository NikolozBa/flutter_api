import 'package:flutter/material.dart';
import 'package:flutter_api/logic/cubits/comments/comments_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key key}) : super(key: key);

  static const routeName = "/comments-screen";

  @override
  Widget build(BuildContext context) {
    final int postId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: BlocConsumer<CommentsCubit, CommentsState>(
        listener: (context, state){

          if(state is CommentsError){
            showDialog(context: context, builder: (_)=>AlertDialog(
              title: Text("ERROR"),
              content: Text(state.errorMessage),
              actions: [
                TextButton(
                  onPressed: (){
                    return Navigator.pop(context);
                  },
                  child: Text("OK"),
                )
              ],
            ));
          }
        },
        builder: (context, state){

          if(state is CommentsInitial){

            BlocProvider.of<CommentsCubit>(context).getComments(postId);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is CommentsLoaded){
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            state.comments[index].name,
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text(
                            state.comments[index].email,
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 20),
                          child: Text(
                            state.comments[index].body,
                            style: TextStyle(
                                fontSize: 22
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),

    );
  }
}

