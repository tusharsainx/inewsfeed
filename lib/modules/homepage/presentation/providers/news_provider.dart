import 'package:flutter/material.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:logger/logger.dart';
import '../../domain/usecases/fetch_top_headlines_news.dart';

class NewsProvider extends ChangeNotifier {
  final FetchTopHeadlinesNews fetchTopHeadlinesNews;

  NewsProvider(this.fetchTopHeadlinesNews);
  final Logger logger = Logger();

  NewsTopHeadlinesDataModel _topHeadlines = NewsTopHeadlinesDataModel();
  NewsTopHeadlinesDataModel get topHeadlines => _topHeadlines;
  bool isLoadingTopHeadlines = true;

  Future<void> fetchTopHeadlines(BuildContext context) async {
    isLoadingTopHeadlines = true;
    notifyListeners();
    _topHeadlines = await fetchTopHeadlinesNews.execute(context);
    isLoadingTopHeadlines = false;
    notifyListeners();
  }
}
