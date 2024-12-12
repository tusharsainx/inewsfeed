// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_top_headlines_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsTopHeadlinesDataModel _$NewsTopHeadlinesDataModelFromJson(
        Map<String, dynamic> json) =>
    NewsTopHeadlinesDataModel(
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => NewsArticleDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      totalResults: (json['totalResults'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NewsTopHeadlinesDataModelToJson(
        NewsTopHeadlinesDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
