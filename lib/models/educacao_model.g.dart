// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'educacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Educacao _$EducacaoFromJson(Map<String, dynamic> json) {
  return Educacao(
    id: json['id'] as String,
    degree: json['degree'] as String,
    schoolName: json['schoolName'] as String,
    graduationYear: json['graduationYear'] as String,
  );
}

Map<String, dynamic> _$EducacaoToJson(Educacao instance) => <String, dynamic>{
      'id': instance.id,
      'degree': instance.degree,
      'schoolName': instance.schoolName,
      'graduationYear': instance.graduationYear,
    };
