import 'package:hellohit/models/avatar_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'usuario_model.g.dart';

@JsonSerializable()
class Usuario {
  String id;
  // ignore: non_constant_identifier_names
  String full_name;
  int hits;
  int fans;
  List skills;
  String email;
  String userType;
  // ignore: non_constant_identifier_names
  String signature_status;
  String token;
  Avatar avatar;
  String avatarImg;
  DateTime createdAt;
  DateTime updatedAt;

  Usuario({
    this.id,
    // ignore: non_constant_identifier_names
    this.full_name,
    this.hits,
    this.fans,
    this.skills,
    this.email,
    this.userType,
    this.updatedAt,
    this.createdAt,
    this.avatar,
    // ignore: non_constant_identifier_names
    this.signature_status,
    this.token,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
