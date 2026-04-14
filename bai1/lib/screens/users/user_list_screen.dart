import 'package:flutter/material.dart';
import '../../common/widgets/app_loading.dart';
import '../../common/widgets/user_tile.dart';
import '../../controllers/user_controller.dart';
import '../../models/user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late final UserController _controller;
  late Future<List<UserModel>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _controller = UserController();
    _futureUsers = _controller.fetchUsers();
  }

  Future<void> _refreshUsers() async {
    setState(() {
      _futureUsers = _controller.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách User'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoading();
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Không có dữ liệu'),
            );
          }

          final users = snapshot.data!;

          return RefreshIndicator(
            onRefresh: _refreshUsers,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserTile(user: users[index]);
              },
            ),
          );
        },
      ),
    );
  }
}