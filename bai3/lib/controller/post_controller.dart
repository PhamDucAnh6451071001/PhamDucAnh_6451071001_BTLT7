import '../models/post_model.dart';

class PostController {
  Future<PostModel> createPost({
    required String title,
    required String body,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    return PostModel(
      title: title,
      body: body,
      createdAt: DateTime.now(),
    );
  }
}