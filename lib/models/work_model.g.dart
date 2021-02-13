// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) {
  return Work(
    fulltime: json['fulltime'] as bool,
    freelance: json['freelance'] as bool,
    beSponsored: json['beSponsored'] as bool,
  );
}

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      'fulltime': instance.fulltime,
      'freelance': instance.freelance,
      'beSponsored': instance.beSponsored,
    };
