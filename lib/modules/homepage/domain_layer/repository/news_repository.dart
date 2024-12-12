import 'package:inewsfeed/modules/homepage/data_layer/news_repository_impl.dart';
import 'package:inewsfeed/modules/homepage/domain_layer/data_model/news_top_headlines_data_model.dart';
import 'package:inewsfeed/shared/network_requester/network_requester.dart';

abstract class NewsRepository {
  factory NewsRepository() => NewsRepositoryImpl(NetworkRequester());
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesData();
}
