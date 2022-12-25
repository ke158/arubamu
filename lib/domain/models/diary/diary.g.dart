// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Diary _$$_DiaryFromJson(Map<String, dynamic> json) => _$_Diary(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imagePath: json['imagePath'] as String?,
      content: json['content'] as String?,
      diaryDay: json['diaryDay'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_DiaryToJson(_$_Diary instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imagePath': instance.imagePath,
      'content': instance.content,
      'diaryDay': instance.diaryDay,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
