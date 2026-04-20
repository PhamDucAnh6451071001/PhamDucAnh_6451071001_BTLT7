import 'package:flutter/material.dart';
import '../controller/news_controller.dart';
import '../models/news_model.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final NewsController controller = NewsController();
  List<NewsModel> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    final result = await controller.getNews();
    setState(() {
      newsList = result;
      isLoading = false;
    });
  }

  Future<void> refreshNews() async {
    final result = await controller.getNews();
    setState(() {
      newsList = result;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã refresh dữ liệu')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pull to Refresh')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: refreshNews,
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(newsList[index].title),
            );
          },
        ),
      ),
    );
  }
}