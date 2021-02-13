// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Premio _$PremioFromJson(Map<String, dynamic> json) {
  return Premio(
    awardName: json['awardName'] as String,
    description: json['description'] as String,
    month: json['month'] as String,
    year: json['year'] as int,
  );
}

Map<String, dynamic> _$PremioToJson(Premio instance) => <String, dynamic>{
      'awardName': instance.awardName,
      'description': instance.description,
      'month': instance.month,
      'year': instance.year,
    };
