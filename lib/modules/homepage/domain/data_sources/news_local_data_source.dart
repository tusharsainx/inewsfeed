import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';

abstract class NewsLocalDataSource {
  factory NewsLocalDataSource() => NewsLocalDataSourceImpl();
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesData();
}
