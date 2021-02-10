// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) {
  return Search(
    skills: json['skills'] as String,
    location: json['location'] as String,
    teamOrUser: json['teamOrUser'] as String,
  );
}

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'skills': instance.skills,
      'location': instance.location,
      'teamOrUser': instance.teamOrUser,
    };
