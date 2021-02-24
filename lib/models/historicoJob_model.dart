import 'package:json_annotation/json_annotation.dart';

part 'historicoJob_model.g.dart';

@JsonSerializable()
class HistoricoJob {
  String fromMonth;
  int fromYear;
  String toMonth;
  int toYear;
  String degree;
  String role;
  String company;
  HistoricoJob({
    this.fromMonth,
    this.fromYear,
    this.toMonth,
    this.toYear,
    this.degree,
    this.role,
    this.company,
  });

  factory HistoricoJob.fromJson(Map<String, dynamic> json) => _$HistoricoJobFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricoJobToJson(this);
}
