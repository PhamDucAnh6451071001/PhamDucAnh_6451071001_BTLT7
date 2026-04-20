class PostModel {
  final String title;
  final String body;
  final DateTime createdAt;

  PostModel({
    required this.title,
    required this.body,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'PostModel(title: $title, body: $body, createdAt: $createdAt)';
  }
}