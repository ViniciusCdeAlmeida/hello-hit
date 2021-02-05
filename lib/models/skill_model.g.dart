// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return Skill(
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
