// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_source_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsArticleSourceDataModelAdapter
    extends TypeAdapter<NewsArticleSourceDataModel> {
  @override
  final int typeId = 1;

  @override
  NewsArticleSourceDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsArticleSourceDataModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsArticleSourceDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsArticleSourceDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticleSourceDataModel _$NewsArticleSourceDataModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleSourceDataModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NewsArticleSourceDataModelToJson(
        NewsArticleSourceDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
