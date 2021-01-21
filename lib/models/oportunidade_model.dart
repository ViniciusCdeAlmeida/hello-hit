import 'package:json_annotation/json_annotation.dart';

part 'oportunidade_model.g.dart';

@JsonSerializable()
class Oportunidade {
  final int id;
  final String nomeOrganizacao;
  final String imagem;
  final String banner;
  final String categoria;
  final String descricao;
  final DateTime duracaoOportunidade;
  final String video;

  Oportunidade({
    this.id,
    this.nomeOrganizacao,
    this.imagem,
    this.categoria,
    this.descricao,
    this.duracaoOportunidade,
    this.video,
    this.banner,
  });

  factory Oportunidade.fromJson(Map<String, dynamic> json) =>
      _$OportunidadeFromJson(json);

  Map<String, dynamic> toJson() => _$OportunidadeToJson(this);
}
