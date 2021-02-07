// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historicoJob_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricoJob _$HistoricoJobFromJson(Map<String, dynamic> json) {
  return HistoricoJob(
    from: json['from'],
    to: json['to'],
    degree: json['degree'] as String,
    role: json['role'] as String,
    company: json['company'] as String,
  );
}

Map<String, dynamic> _$HistoricoJobToJson(HistoricoJob instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'degree': instance.degree,
      'role': instance.role,
      'company': instance.company,
    };
