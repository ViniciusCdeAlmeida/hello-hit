import 'package:json_annotation/json_annotation.dart';

part 'premio_model.g.dart';

@JsonSerializable()
class Premio {
  String awardName;
  String description;
  String month;
  int year;
  Premio({
    this.awardName,
    this.description,
    this.month,
    this.year,
  });

  factory Premio.fromJson(Map<String, dynamic> json) => _$PremioFromJson(json);

  Map<String, dynamic> toJson() => _$PremioToJson(this);
}
