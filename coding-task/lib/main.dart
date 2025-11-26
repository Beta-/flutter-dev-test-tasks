import 'package:flutter/material.dart';
import 'screens/posts_screen.dart';

void main() {
  runApp(const PostsApp());
}

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts Viewer',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const PostsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
