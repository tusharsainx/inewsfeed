import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_article_source_data_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class NewsArticleSourceDataModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  NewsArticleSourceDataModel({this.id, this.name});
  factory NewsArticleSourceDataModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSourceDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsArticleSourceDataModelToJson(this);
}
