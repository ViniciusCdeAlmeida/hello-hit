import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/models/conversation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class Message {
  String id;
  Usuario usuario;
  Conversation conversation;
  String text;

  Message({
    this.id,
    this.usuario,
    this.conversation,
    this.text,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
