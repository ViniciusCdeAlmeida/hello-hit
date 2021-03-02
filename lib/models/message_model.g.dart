// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['_id'] as String,
    author: json['author'] as String,
    conversation: json['conversation'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'conversation': instance.conversation,
      'text': instance.text,
    };
