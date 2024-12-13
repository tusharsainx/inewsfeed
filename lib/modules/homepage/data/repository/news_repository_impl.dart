import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:inewsfeed/modules/homepage/data/sources/news_local_data_source.dart';
import 'package:inewsfeed/modules/homepage/data/sources/news_remote_data_source.dart';
import 'package:inewsfeed/modules/homepage/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _newsRemoteDataSource;
  final NewsLocalDataSource _newsLocalDataSource;

  NewsRepositoryImpl(this._newsLocalDataSource, this._newsRemoteDataSource);

  @override
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesDataFromApi() async {
    try {
      return await _newsRemoteDataSource.fetchTopHeadlinesNews();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesDataFromLocal() async {
    try {
      return await _newsLocalDataSource.fetchTopHeadlinesNews();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveNewsToLocalStorage(NewsTopHeadlinesDataModel news) async {
    try {
      return await _newsLocalDataSource.saveTopHeadlinesNews(news);
    } catch (e) {
      rethrow;
    }
  }
}
