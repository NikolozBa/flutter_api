import 'package:flutter/material.dart';
import 'package:flutter_api/presentation/screens/comments_screen.dart';
import 'package:flutter_api/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'data/repositories/comment_repository.dart';
import 'data/repositories/post_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostRepository>(create: (_) => PostRepository()),
        ChangeNotifierProvider<CommentRepository>(create: (_) => CommentRepository())
      ],
      child: MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
            accentColor: Colors.purpleAccent,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                )
            )

        ),
        home: HomeScreen(),
        routes: {
          CommentsScreen.routeName: (ctx) => CommentsScreen(),
        },
      ),
    );
  }
}
