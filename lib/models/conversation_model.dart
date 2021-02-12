import 'package:hellohit/models/usuario_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_model.g.dart';

@JsonSerializable()
class Conversation {
  @JsonKey(name: '_id')
  String id;
  Usuario receiver;
  Usuario sender;

  Conversation({
    this.id,
    this.receiver,
    this.sender,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
