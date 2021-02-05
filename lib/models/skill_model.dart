import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/post_model.dart';

part 'skill_model.g.dart';

@JsonSerializable()
class Skill {
  String title;
  String description;
  Skill({
    this.title,
    this.description,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
