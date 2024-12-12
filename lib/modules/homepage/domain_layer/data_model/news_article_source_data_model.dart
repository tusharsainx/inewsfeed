import 'package:json_annotation/json_annotation.dart';
part 'news_article_source_data_model.g.dart';

@JsonSerializable()
class NewsArticleSourceDataModel {
  final String? id;
  final String? name;
  NewsArticleSourceDataModel({this.id, this.name});
  factory NewsArticleSourceDataModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSourceDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsArticleSourceDataModelToJson(this);
}
