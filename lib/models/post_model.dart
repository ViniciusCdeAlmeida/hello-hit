import 'package:hellohit/models/comentario_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final List<Comentario> comentario;
  final int hits;
  final List<int> idsComentario;
  final String imagem;

  Post({
    this.id,
    this.comentario,
    this.hits,
    this.idsComentario,
    this.imagem,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
