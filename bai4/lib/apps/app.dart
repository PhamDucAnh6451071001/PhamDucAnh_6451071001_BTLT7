import 'package:flutter/material.dart';
import '../views/update_user_view.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 4',
      home: const UpdateUserView(),
    );
  }
}