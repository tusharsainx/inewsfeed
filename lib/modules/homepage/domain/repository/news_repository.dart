import 'package:hive_flutter/hive_flutter.dart';
import 'package:inewsfeed/modules/homepage/data/repository/news_repository_impl.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:inewsfeed/modules/homepage/data/sources/news_local_data_source.dart';
import 'package:inewsfeed/modules/homepage/data/sources/news_remote_data_source.dart';
import 'package:inewsfeed/shared/hive_boxes.dart';
import 'package:inewsfeed/shared/network_requester/network_requester.dart';

abstract class NewsRepository {
  factory NewsRepository() => NewsRepositoryImpl(
        NewsLocalDataSource(
          Hive.box<NewsTopHeadlinesDataModel>(HiveBoxes.newsTopHeadlinesBox),
        ),
        NewsRemoteDataSource(
          NetworkRequester(),
        ),
      );
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesDataFromApi();
  Future<NewsTopHeadlinesDataModel> getNewsTopHeadlinesDataFromLocal();
  Future<void> saveNewsToLocalStorage(NewsTopHeadlinesDataModel news);
}
