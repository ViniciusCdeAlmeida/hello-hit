import 'package:json_annotation/json_annotation.dart';

part 'categoria_model.g.dart';

@JsonSerializable()
class Categoria {
  @JsonKey(name: '_id')
  String id;
  String name = '';
  String description = '';
  String imageUrl = '';
  Categoria({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => _$CategoriaFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriaToJson(this);
}
