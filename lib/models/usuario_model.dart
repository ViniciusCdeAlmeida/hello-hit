import 'package:hellohit/models/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
class Usuario {
  final int id;
  String nome;
  int hits;
  int fans;
  List skills;
  String localizacao;
  String imagem;
  String categoria;
  String mensagem;
  List<Post> posts;
  List idUsuarios;
  List<Usuario> usuarios;
  bool premium;
  bool time;

  Usuario({
    this.id,
    this.nome,
    this.hits,
    this.fans,
    this.skills,
    this.imagem,
    this.localizacao,
    this.posts,
    this.usuarios,
    this.idUsuarios,
    this.premium,
    this.time,
    this.categoria,
    this.mensagem,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
