// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'especialidade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Especialidade _$EspecialidadeFromJson(Map<String, dynamic> json) {
  return Especialidade(
    title: json['title'] as String,
    description: json['description'] as String,
    years: json['years'] as String,
  );
}

Map<String, dynamic> _$EspecialidadeToJson(Especialidade instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'years': instance.years,
    };
