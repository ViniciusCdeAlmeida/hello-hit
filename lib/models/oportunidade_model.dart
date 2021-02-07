import 'package:json_annotation/json_annotation.dart';

part 'oportunidade_model.g.dart';

@JsonSerializable()
class Oportunidade {
  String id;
  String title;
  String imageUrl;
  String location;
  String typeOpportunity;
  String urlYoutube;
  DateTime duracaoOportunidade;
  String team;
  String website;

  Oportunidade({
    this.id,
    this.title,
    this.imageUrl,
    this.location,
    this.typeOpportunity,
    this.urlYoutube,
    this.duracaoOportunidade,
    this.team,
    this.website,
  });

  factory Oportunidade.fromJson(Map<String, dynamic> json) =>
      _$OportunidadeFromJson(json);

  Map<String, dynamic> toJson() => _$OportunidadeToJson(this);
}
