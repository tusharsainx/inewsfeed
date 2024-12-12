// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticleDataModel _$NewsArticleDataModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleDataModel(
      author: json['author'] as String?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      title: json['title'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      source: json['source'] == null
          ? null
          : NewsArticleSourceDataModel.fromJson(
              json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsArticleDataModelToJson(
        NewsArticleDataModel instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'content': instance.content,
    };
