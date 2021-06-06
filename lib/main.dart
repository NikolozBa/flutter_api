import 'package:flutter/material.dart';
import 'package:flutter_api/logic/cubits/comments/comments_cubit.dart';
import 'package:flutter_api/logic/cubits/posts/posts_cubit.dart';
import 'package:flutter_api/presentation/screens/comments_screen.dart';
import 'package:flutter_api/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsCubit>(create: (context)=> PostsCubit()),
        BlocProvider<CommentsCubit>(create: (context)=> CommentsCubit())
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
