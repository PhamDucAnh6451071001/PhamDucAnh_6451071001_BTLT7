import 'package:flutter/material.dart';

import '../views/delete_task_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 5',
      home: const DeleteTaskView(),
    );
  }
}