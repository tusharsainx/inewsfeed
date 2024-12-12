abstract class NewsRemoteDataSource {
  factory NewsRepository() => NewsRepositoryImpl(NetworkRequester());
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesData();
}
