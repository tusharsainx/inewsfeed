import 'package:hive/hive.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';

class NewsLocalDataSource {
  final Box<NewsTopHeadlinesDataModel> _box;
  NewsLocalDataSource(this._box);
  Future<NewsTopHeadlinesDataModel> fetchTopHeadlinesNews() async {
    if (_box.isEmpty) {
      return NewsTopHeadlinesDataModel();
    }
    return _box.values.first;
  }

  Future<void> saveTopHeadlinesNews(NewsTopHeadlinesDataModel news) async {
    await _box.clear();
    await _box.add(news);
    return;
  }
}
