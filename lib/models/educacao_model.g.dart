// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'educacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Educacao _$EducacaoFromJson(Map<String, dynamic> json) {
  return Educacao(
    id: json['_id'] as String,
    degree: json['degree'] as String,
    schoolName: json['schoolName'] as String,
    graduationYear: json['graduationYear'] as int,
  );
}

Map<String, dynamic> _$EducacaoToJson(Educacao instance) => <String, dynamic>{
      '_id': instance.id,
      'degree': instance.degree,
      'schoolName': instance.schoolName,
      'graduationYear': instance.graduationYear,
    };
