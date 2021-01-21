import 'package:json_annotation/json_annotation.dart';

part 'comentario_model.g.dart';

@JsonSerializable()
class Comentario {
  final int id;
  final String comentario;
  final int idPost;

  Comentario({
    this.id,
    this.comentario,
    this.idPost,
  });

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);

  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
