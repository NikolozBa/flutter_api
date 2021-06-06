import 'package:flutter/material.dart';
import 'package:flutter_api/logic/cubits/comments/comments_cubit.dart';
import 'package:flutter_api/logic/cubits/posts/posts_cubit.dart';
import 'package:flutter_api/presentation/screens/comments_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: BlocConsumer<PostsCubit, PostsState>(
          listener: (context, state) {
            if(state is PostsError){
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
          builder: (context, state) {
            if(state is PostsInitial){
              BlocProvider.of<PostsCubit>(context).getPosts();
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is PostsLoaded){
              return ListView.builder(
                
                itemCount: state.posts.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: (){
                      BlocProvider.of<CommentsCubit>(context).wipeData();
                      return Navigator.pushNamed(context, CommentsScreen.routeName, arguments: state.posts[index].id);
                    },
                    child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 12),
                                  child: Text(
                                    state.posts[index].title,
                                    style: TextStyle(
                                        fontSize: 25
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 12, bottom: 20),
                                  child: Text(
                                    state.posts[index].body,
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ),
                    ),


                      
                  );
                },
              );
            }
            return Container();

          },
        )




    );
  }
}
