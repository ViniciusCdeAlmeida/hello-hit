import 'package:json_annotation/json_annotation.dart';

part 'autenticacao_model.g.dart';

@JsonSerializable()
class Autenticacao {
  String email;
  String password;

  Autenticacao({
    this.email,
    this.password,
  });

  factory Autenticacao.fromJson(Map<String, dynamic> json) =>
      _$AutenticacaoFromJson(json);

  Map<String, dynamic> toJson() => _$AutenticacaoToJson(this);
}
