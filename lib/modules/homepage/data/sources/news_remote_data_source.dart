import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:inewsfeed/shared/network_requester/apis.dart';
import 'package:inewsfeed/shared/network_requester/method_type_enum.dart';
import 'package:inewsfeed/shared/network_requester/network_requester.dart';

class NewsRemoteDataSource {
  final NetworkRequester _networkRequester;
  NewsRemoteDataSource(this._networkRequester);
  Future<NewsTopHeadlinesDataModel> fetchTopHeadlinesNews() async {
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
