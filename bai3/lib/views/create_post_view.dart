import 'package:flutter/material.dart';
import '../controller/post_controller.dart';
import '../models/post_model.dart';
import '../utils/app_message.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final PostController postController = PostController();

  bool isLoading = false;
  PostModel? createdPost;

  Future<void> handleCreatePost() async {
    if (titleController.text.trim().isEmpty || bodyController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final post = await postController.createPost(
      title: titleController.text.trim(),
      body: bodyController.text.trim(),
    );

    setState(() {
      createdPost = post;
      isLoading = false;
    });

    debugPrint(post.toString());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(AppMessage.createSuccess)),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : handleCreatePost,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Create Post'),
            ),
            const SizedBox(height: 20),
            if (createdPost != null)
              Card(
                child: ListTile(
                  title: Text(createdPost!.title),
                  subtitle: Text(createdPost!.body),
                ),
              ),
          ],
        ),
      ),
    );
  }
}