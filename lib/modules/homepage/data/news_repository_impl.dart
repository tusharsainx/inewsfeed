import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:inewsfeed/modules/homepage/domain/repository/news_repository.dart';
import 'package:inewsfeed/shared/network_requester/apis.dart';
import 'package:inewsfeed/shared/network_requester/method_type_enum.dart';
import 'package:inewsfeed/shared/network_requester/network_requester.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkRequester _networkRequester;
  NewsRepositoryImpl(this._networkRequester);

  @override
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesData() async {
    try {
      final response = await _networkRequester.request(
        Api.baseUrl,
        "${Api.path}?country=us&apiKey=${const String.fromEnvironment('NEWS_API_KEY')}",
        MethodType.get,
      );
      return NewsTopHeadlinesDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
