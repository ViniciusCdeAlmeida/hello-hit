import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/post_model.dart';

part 'especialidade_model.g.dart';

@JsonSerializable()
class Especialidade {
  String title;
  String description;
  String years;
  Especialidade({
    this.title,
    this.description,
    this.years,
  });

  factory Especialidade.fromJson(Map<String, dynamic> json) =>
      _$EspecialidadeFromJson(json);

  Map<String, dynamic> toJson() => _$EspecialidadeToJson(this);
}
