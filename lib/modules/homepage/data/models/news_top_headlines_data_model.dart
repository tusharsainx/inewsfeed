import 'package:hive_flutter/hive_flutter.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_article_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_top_headlines_data_model.g.dart';

@HiveType(typeId: 0) //unique id for this model
@JsonSerializable()
class NewsTopHeadlinesDataModel {
  @HiveField(0)
  final String? status;
  @HiveField(1)
  final int? totalResults;
  @HiveField(2)
  final List<NewsArticleDataModel>? articles;

  NewsTopHeadlinesDataModel({this.articles, this.status, this.totalResults});

  factory NewsTopHeadlinesDataModel.fromJson(Map<String, dynamic> json) =>
      _$NewsTopHeadlinesDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsTopHeadlinesDataModelToJson(this);
}
