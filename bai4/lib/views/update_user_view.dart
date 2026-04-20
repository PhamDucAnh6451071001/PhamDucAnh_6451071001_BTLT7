import 'package:flutter/material.dart';
import '../controller/user_controller.dart';
import '../models/user_model.dart';
import '../utils/app_message.dart';

class UpdateUserView extends StatefulWidget {
  const UpdateUserView({super.key});

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {
  final formKey = GlobalKey<FormState>();
  final UserController controller = UserController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool isLoading = true;
  UserModel? updatedUser;

  @override
  void initState() {
    super.initState();
    loadOldData();
  }

  Future<void> loadOldData() async {
    final user = await controller.getUser();
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;

    setState(() {
      updatedUser = user;
      isLoading = false;
    });
  }

  Future<void> handleUpdate() async {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    final newUser = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
    );

    final result = await controller.updateUser(newUser);

    setState(() {
      updatedUser = result;
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(AppMessage.updateSuccess)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && updatedUser == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Update User Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Nhập tên' : null,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Nhập email' : null,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Nhập số điện thoại' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : handleUpdate,
                    child: const Text('Update'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (updatedUser != null)
              Card(
                child: ListTile(
                  title: Text(updatedUser!.name),
                  subtitle: Text('${updatedUser!.email}\n${updatedUser!.phone}'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}