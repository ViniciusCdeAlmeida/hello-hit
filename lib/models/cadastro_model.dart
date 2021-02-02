import 'package:json_annotation/json_annotation.dart';

part 'cadastro_model.g.dart';

@JsonSerializable()
class Cadastro {
  String fullName;
  String email;
  String password;
  String userType;
  String userName;
  String gender;
  String confirmPassword;

  Cadastro({
    this.fullName,
    this.email,
    this.password,
    this.userType,
    this.userName,
    this.gender,
    this.confirmPassword,
  });

  factory Cadastro.fromJson(Map<String, dynamic> json) =>
      _$CadastroFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroToJson(this);
}
