import 'package:flutter/material.dart';
import 'package:flutter_api/data/repositories/post_repository.dart';
import 'package:flutter_api/presentation/screens/comments_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<PostRepository>(
        builder: (context, dataObj, child){

          return ListView.builder(
            itemCount: Provider.of<PostRepository>(context, listen: false).posts.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, CommentsScreen.routeName, arguments: Provider.of<PostRepository>(context, listen: false).posts[index].id),
                child: Column(
                  children: [
                    Container(

                        child: Text(Provider.of<PostRepository>(context, listen: false).posts[index].title),
                        padding: EdgeInsets.all(50)
                    )

                  ],
                ),
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
