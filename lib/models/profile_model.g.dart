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
    experiences: json['experiences'] as List,
    categories: (json['categories'] as List)?.map((e) => e as String)?.toList(),
    hits: (json['hits'] as List)?.map((e) => e as String)?.toList(),
    teams: (json['teams'] as List)?.map((e) => e as String)?.toList(),
    fans: (json['fans'] as List)?.map((e) => e as String)?.toList(),
    fansCount: json['fansCount'] as int,
    hitCount: json['hitCount'] as int,
    location: json['location'] as String,
    bio: json['bio'] as String,
    personalWebsite: json['personalWebsite'] as String,
    workAvailability: json['workAvailability'] == null
        ? null
        : Work.fromJson(json['workAvailability'] as Map<String, dynamic>),
    banner: json['banner'] as String,
    avatar: json['avatar'] as String,
    openOpportunities: (json['openOpportunities'] as List)
        ?.map((e) =>
            e == null ? null : Oportunidade.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobHistory: (json['jobHistory'] as List)
        ?.map((e) =>
            e == null ? null : HistoricoJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    educations: (json['educations'] as List)
        ?.map((e) =>
            e == null ? null : Educacao.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    posts: (json['posts'] as List)
        ?.map(
            (e) => e == null ? null : Post.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'skills': instance.skills,
      'experiences': instance.experiences,
      'categories': instance.categories,
      'hits': instance.hits,
      'teams': instance.teams,
      'fans': instance.fans,
      'fansCount': instance.fansCount,
      'hitCount': instance.hitCount,
      'location': instance.location,
      'bio': instance.bio,
      'personalWebsite': instance.personalWebsite,
      'workAvailability': instance.workAvailability,
      'banner': instance.banner,
      'avatar': instance.avatar,
      'openOpportunities': instance.openOpportunities,
      'jobHistory': instance.jobHistory,
      'educations': instance.educations,
      'posts': instance.posts,
    };
