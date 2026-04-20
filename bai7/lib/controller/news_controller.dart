import '../models/news_model.dart';

class NewsController {
  int refreshCount = 0;

  Future<List<NewsModel>> getNews() async {
    await Future.delayed(const Duration(seconds: 1));

    refreshCount++;

    return [
      NewsModel(title: 'Tin tức số 1 - Lần tải $refreshCount'),
      NewsModel(title: 'Tin tức số 2 - Lần tải $refreshCount'),
      NewsModel(title: 'Tin tức số 3 - Lần tải $refreshCount'),
      NewsModel(title: 'Tin tức số 4 - Lần tải $refreshCount'),
    ];
  }
}