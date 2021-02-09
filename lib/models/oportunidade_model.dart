import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/categoria_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/models/usuario_model.dart';

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
  Usuario cadidates;
  int hitCount;
  List<Usuario> hits;
  List<Usuario> fans;

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
    this.cadidates,
    this.hitCount,
    this.hits,
    this.fans,
  });

  factory Oportunidade.fromJson(Map<String, dynamic> json) =>
      _$OportunidadeFromJson(json);

  Map<String, dynamic> toJson() => _$OportunidadeToJson(this);
}
