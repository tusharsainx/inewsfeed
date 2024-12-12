import 'package:hive_flutter/hive_flutter.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_article_source_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_article_data_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class NewsArticleDataModel {
  @HiveField(0)
  final NewsArticleSourceDataModel? source;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? urlToImage;
  @HiveField(6)
  final DateTime? publishedAt;
  @HiveField(7)
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
