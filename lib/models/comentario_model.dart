import 'package:hellohit/models/usuario_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comentario_model.g.dart';

@JsonSerializable()
class Comentario {
  String id;
  final String body;

  Comentario({
    this.id,
    this.body,
  });

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);

  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
