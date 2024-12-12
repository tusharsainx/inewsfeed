import 'package:inewsfeed/modules/homepage/domain_layer/data_model/news_article_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_top_headlines_data_model.g.dart';

@JsonSerializable()
class NewsTopHeadlinesDataModel {
  final String? status;
  final int? totalResults;
  final List<NewsArticleDataModel>? articles;
  NewsTopHeadlinesDataModel({this.articles, this.status, this.totalResults});
  factory NewsTopHeadlinesDataModel.fromJson(Map<String, dynamic> json) =>
      _$NewsTopHeadlinesDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsTopHeadlinesDataModelToJson(this);
}
