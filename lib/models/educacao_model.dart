import 'package:json_annotation/json_annotation.dart';

part 'educacao_model.g.dart';

@JsonSerializable()
class Educacao {
  @JsonKey(name: '_id')
  String id;
  String degree;
  String schoolName;
  int graduationYear;
  Educacao({
    this.id,
    this.degree,
    this.schoolName,
    this.graduationYear,
  });

  factory Educacao.fromJson(Map<String, dynamic> json) =>
      _$EducacaoFromJson(json);

  Map<String, dynamic> toJson() => _$EducacaoToJson(this);
}
