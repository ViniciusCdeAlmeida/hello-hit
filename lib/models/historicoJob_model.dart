import 'package:json_annotation/json_annotation.dart';

part 'historicoJob_model.g.dart';

@JsonSerializable()
class HistoricoJob {
  dynamic from;
  dynamic to;
  String degree;
  String role;
  String company;
  HistoricoJob({
    this.from,
    this.to,
    this.degree,
    this.role,
    this.company,
  });

  factory HistoricoJob.fromJson(Map<String, dynamic> json) =>
      _$HistoricoJobFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricoJobToJson(this);
}
