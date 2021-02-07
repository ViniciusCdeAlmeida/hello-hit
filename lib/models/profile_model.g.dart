// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    id: json['_id'] as String,
    user: json['user'] == null
        ? null
        : Usuario.fromJson(json['user'] as Map<String, dynamic>),
    skills: (json['skills'] as List)
        ?.map(
            (e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hitsCount: json['hitsCount'] as int,
    hits: (json['hits'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    teams: (json['teams'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] as String,
    bio: json['bio'] as String,
    personalWebsite: json['personalWebsite'] as String,
    workAvailability: json['workAvailability'] as String,
    openOpportunities: (json['openOpportunities'] as List)
        ?.map((e) =>
            e == null ? null : Oportunidade.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobHistory: (json['jobHistory'] as List)
        ?.map((e) =>
            e == null ? null : HistoricoJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    banner: json['banner'] as String,
    avatar: json['avatar'] as String,
    educations: (json['educations'] as List)
        ?.map((e) =>
            e == null ? null : Educacao.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    freelance: json['freelance'] as bool,
    fullTime: json['fullTime'] as bool,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'skills': instance.skills,
      'hitsCount': instance.hitsCount,
      'hits': instance.hits,
      'teams': instance.teams,
      'location': instance.location,
      'bio': instance.bio,
      'personalWebsite': instance.personalWebsite,
      'workAvailability': instance.workAvailability,
      'banner': instance.banner,
      'avatar': instance.avatar,
      'openOpportunities': instance.openOpportunities,
      'jobHistory': instance.jobHistory,
      'educations': instance.educations,
      'fullTime': instance.fullTime,
      'freelance': instance.freelance,
    };
