import 'package:json_annotation/json_annotation.dart';

part 'comentario_model.g.dart';

@JsonSerializable()
class Comentario {
  @JsonKey(name: '_id')
  String id;
  String text;

  Comentario({
    this.id,
    this.text,
  });

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);

  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
