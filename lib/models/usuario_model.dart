import 'package:hellohit/models/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
class Usuario {
  final int id;
  String nome;
  int hits;
  int fans;
  List<String> skills;
  String localizacao;
  String imagem;
  List<Post> posts;
  List<Usuario> idUsuario;

  Usuario({
    this.id,
    this.nome,
    this.hits,
    this.fans,
    this.skills,
    this.imagem,
    this.localizacao,
    this.posts,
    this.idUsuario,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
