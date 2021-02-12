// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return Conversation(
    id: json['_id'] as String,
    receiver: json['receiver'] == null
        ? null
        : Usuario.fromJson(json['receiver'] as Map<String, dynamic>),
    sender: json['sender'] == null
        ? null
        : Usuario.fromJson(json['sender'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'receiver': instance.receiver,
      'sender': instance.sender,
    };
