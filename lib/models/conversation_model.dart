import 'package:hellohit/models/usuario_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_model.g.dart';

@JsonSerializable()
class Conversation {
  List<Usuario> members;

  Usuario creator;

  Conversation({
    this.members,
    this.creator,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
