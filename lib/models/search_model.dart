import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class Search {
  String skills;
  String location;
  String teamOrUser;
  Search({
    this.skills,
    this.location,
    this.teamOrUser,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
