// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historicoJob_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricoJob _$HistoricoJobFromJson(Map<String, dynamic> json) {
  return HistoricoJob(
    fromMonth: json['fromMonth'] as String,
    fromYear: json['fromYear'] as int,
    toMonth: json['toMonth'] as String,
    toYear: json['toYear'] as int,
    degree: json['degree'] as String,
    role: json['role'] as String,
    company: json['company'] as String,
  );
}

Map<String, dynamic> _$HistoricoJobToJson(HistoricoJob instance) =>
    <String, dynamic>{
      'fromMonth': instance.fromMonth,
      'fromYear': instance.fromYear,
      'toMonth': instance.toMonth,
      'toYear': instance.toYear,
      'degree': instance.degree,
      'role': instance.role,
      'company': instance.company,
    };
