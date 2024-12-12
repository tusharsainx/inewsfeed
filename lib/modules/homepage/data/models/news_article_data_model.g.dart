// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsArticleDataModelAdapter extends TypeAdapter<NewsArticleDataModel> {
  @override
  final int typeId = 2;

  @override
  NewsArticleDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsArticleDataModel(
      author: fields[1] as String?,
      content: fields[7] as String?,
      description: fields[3] as String?,
      publishedAt: fields[6] as DateTime?,
      title: fields[2] as String?,
      url: fields[4] as String?,
      urlToImage: fields[5] as String?,
      source: fields[0] as NewsArticleSourceDataModel?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsArticleDataModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.publishedAt)
      ..writeByte(7)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsArticleDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
