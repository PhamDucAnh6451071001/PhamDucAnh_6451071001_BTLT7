import 'package:flutter/material.dart';
import '../views/create_post_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 3 - Create Post',
      home: const CreatePostView(),
    );
  }
}