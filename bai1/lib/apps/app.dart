import 'package:flutter/material.dart';
import '../screens/users/user_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const UserListScreen(),
    );
  }
}