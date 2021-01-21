import 'package:json_annotation/json_annotation.dart';

part 'carreira_model.g.dart';

@JsonSerializable()
class Carreira {
  final int id;
  final String nomeOrganizacao;
  final String imagem;
  final String banner;
  final String categoria;
  final String descricao;
  final DateTime duracaoOportunidade;
  final String video;

  Carreira({
    this.id,
    this.nomeOrganizacao,
    this.imagem,
    this.categoria,
    this.descricao,
    this.duracaoOportunidade,
    this.video,
    this.banner,
  });

  factory Carreira.fromJson(Map<String, dynamic> json) =>
      _$CarreiraFromJson(json);

  Map<String, dynamic> toJson() => _$CarreiraToJson(this);
}
