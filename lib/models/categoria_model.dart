import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/post_model.dart';

part 'categoria_model.g.dart';

@JsonSerializable()
class Categoria {
  String name;
  String description;
  String imageUrl;
  Categoria({
    this.name,
    this.description,
    this.imageUrl,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) =>
      _$CategoriaFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriaToJson(this);
}
