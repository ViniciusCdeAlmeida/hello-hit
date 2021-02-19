// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileTime _$ProfileTimeFromJson(Map<String, dynamic> json) {
  return ProfileTime(
    id: json['_id'] as String,
    user: json['user'] == null
        ? null
        : Usuario.fromJson(json['user'] as Map<String, dynamic>),
    skills: (json['skills'] as List)
        ?.map(
            (e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    categories: (json['categories'] as List)?.map((e) => e as String)?.toList(),
    hitCount: json['hitCount'] as int,
    fanCount: json['fanCount'] as int,
    sizeTeam: json['sizeTeam'] as int,
    numMaxMembers: json['numMaxMembers'] as int,
    hits: (json['hits'] as List)?.map((e) => e as String)?.toList(),
    fans: (json['fans'] as List)?.map((e) => e as String)?.toList(),
    admins: (json['admins'] as List)?.map((e) => e as String)?.toList(),
    members: (json['members'] as List)?.map((e) => e as String)?.toList(),
    awards: (json['awards'] as List)
        ?.map((e) =>
            e == null ? null : Premio.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bio: json['bio'] as String,
    location: json['location'] as String,
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
    fansProfile: (json['fansProfile'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    membersProfile: (json['membersProfile'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    category: json['category'] == null
        ? null
        : Categoria.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileTimeToJson(ProfileTime instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'skills': instance.skills,
      'categories': instance.categories,
      'hitCount': instance.hitCount,
      'fanCount': instance.fanCount,
      'sizeTeam': instance.sizeTeam,
      'numMaxMembers': instance.numMaxMembers,
      'hits': instance.hits,
      'fans': instance.fans,
      'admins': instance.admins,
      'members': instance.members,
      'awards': instance.awards,
      'bio': instance.bio,
      'location': instance.location,
      'personalWebsite': instance.personalWebsite,
      'workAvailability': instance.workAvailability,
      'banner': instance.banner,
      'avatar': instance.avatar,
      'openOpportunities': instance.openOpportunities,
      'jobHistory': instance.jobHistory,
      'educations': instance.educations,
      'posts': instance.posts,
      'fansProfile': instance.fansProfile,
      'membersProfile': instance.membersProfile,
      'category': instance.category,
    };
