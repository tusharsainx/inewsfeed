// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_top_headlines_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsTopHeadlinesDataModelAdapter
    extends TypeAdapter<NewsTopHeadlinesDataModel> {
  @override
  final int typeId = 0;

  @override
  NewsTopHeadlinesDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsTopHeadlinesDataModel(
      articles: (fields[2] as List?)?.cast<NewsArticleDataModel>(),
      status: fields[0] as String?,
      totalResults: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsTopHeadlinesDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsTopHeadlinesDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
