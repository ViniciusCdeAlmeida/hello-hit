import 'package:json_annotation/json_annotation.dart';

part 'work_model.g.dart';

@JsonSerializable()
class Work {
  bool fulltime;
  bool freelance;
  bool beSponsored;
  Work({
    this.fulltime,
    this.freelance,
    this.beSponsored,
  });

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

  Map<String, dynamic> toJson() => _$WorkToJson(this);
}
