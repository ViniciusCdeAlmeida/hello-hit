import 'package:hellohit/models/usuario_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comentario_model.g.dart';

@JsonSerializable()
class Comentario {
  final int id;
  final String comentario;
  final int idPost;
  final int idUsuario;
  final Usuario usuario;

  Comentario({
    this.id,
    this.comentario,
    this.idPost,
    this.idUsuario,
    this.usuario,
  });

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);

  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
