import 'package:json_annotation/json_annotation.dart';

part 'cadastro_model.g.dart';

@JsonSerializable()
class Cadastro {
  String fullName;
  String email;
  String password;
  String userType;
  String username;
  String gender;
  String confirmPassword;

  Cadastro({
    this.fullName,
    this.email,
    this.password,
    this.userType,
    this.username,
    this.gender,
    this.confirmPassword,
  });

  factory Cadastro.fromJson(Map<String, dynamic> json) =>
      _$CadastroFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroToJson(this);
}
