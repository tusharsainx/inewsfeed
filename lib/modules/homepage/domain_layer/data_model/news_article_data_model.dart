import 'package:inewsfeed/modules/homepage/domain_layer/data_model/news_article_source_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_article_data_model.g.dart';

@JsonSerializable()
class NewsArticleDataModel {
  final NewsArticleSourceDataModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
  NewsArticleDataModel({
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.title,
    this.url,
    this.urlToImage,
    this.source,
  });
  factory NewsArticleDataModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsArticleDataModelToJson(this);
}
