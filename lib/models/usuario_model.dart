import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
class Usuario {
  @JsonKey(name: '_id')
  String id;
  // ignore: non_constant_identifier_names
  String full_name;
  int hits;
  int fans;
  List skills;
  String email;
  String userType;
  String username;
  // ignore: non_constant_identifier_names
  String signature_status;
  String token;
  dynamic avatar;
  String avatarImg;
  DateTime createdAt;
  DateTime updatedAt;
  bool existeCategoria;
  String avatarUrl;

  Usuario({
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    this.id,
    this.full_name,
    this.hits,
    this.fans,
    this.skills,
    this.email,
    this.userType,
    this.username,
    this.signature_status,
    this.token,
    this.avatar,
    this.avatarImg,
    this.createdAt,
    this.updatedAt,
    this.existeCategoria,
    this.avatarUrl,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
