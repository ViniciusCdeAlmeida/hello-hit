import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/models/conversation_model.dart';

class Message {
  Usuario usuario;
  Conversation conversation;
  String text;

  Message({
    this.usuario,
    this.conversation,
    this.text,
  });
}
