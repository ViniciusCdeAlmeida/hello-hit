// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return Conversation(
    members: (json['members'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creator: json['creator'] == null
        ? null
        : Usuario.fromJson(json['creator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'members': instance.members,
      'creator': instance.creator,
    };
