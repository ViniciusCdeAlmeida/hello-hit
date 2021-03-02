import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/models/conversation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: '_id')
  String id;
  String author;
  String conversation;
  String text;

  Message({
    this.id,
    this.author,
    this.conversation,
    this.text,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
