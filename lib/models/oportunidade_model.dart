import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/categoria_model.dart';

part 'oportunidade_model.g.dart';

@JsonSerializable()
class Oportunidade {
  @JsonKey(name: '_id')
  String id;
  String title;
  String description;
  String imageUrl;
  bool isOpen;
  dynamic team;
  String location;
  dynamic typeOpportunity;
  String urlYoutube;
  String website;
  DateTime expireAt;
  Categoria categoria;
  List candidates;
  int hitCount;
  List<String> hits;

  Oportunidade({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.isOpen,
    this.team,
    this.location,
    this.typeOpportunity,
    this.urlYoutube,
    this.website,
    this.expireAt,
    this.categoria,
    this.candidates,
    this.hitCount,
    this.hits,
  });

  factory Oportunidade.fromJson(Map<String, dynamic> json) =>
      _$OportunidadeFromJson(json);

  Map<String, dynamic> toJson() => _$OportunidadeToJson(this);
}
