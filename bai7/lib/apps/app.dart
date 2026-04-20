import 'package:flutter/material.dart';
import '../views/news_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 7',
      home: const NewsView(),
    );
  }
}