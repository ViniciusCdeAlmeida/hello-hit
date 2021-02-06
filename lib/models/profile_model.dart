import 'package:hellohit/models/educacao_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/especialidade_model.dart';
import 'package:hellohit/models/historicoJob_model.dart';
import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/skill_model.dart';
import 'package:hellohit/models/usuario_model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  String id;
  Usuario user;
  List<Skill> skills;
  int hitsCount;
  List<Usuario> hits;
  List<Usuario> teams;
  String location;
  String bio;
  String personalWebsite;
  String workAvailability;
  String banner;
  String avatar;
  List<Oportunidade> openOpportunities;
  List<HistoricoJob> jobHistory;
  List<Educacao> educations;
  bool fullTime;
  bool freelance;
  Profile({
    this.id,
    this.user,
    this.skills,
    this.hitsCount,
    this.hits,
    this.teams,
    this.location,
    this.bio,
    this.personalWebsite,
    this.workAvailability,
    this.openOpportunities,
    this.jobHistory,
    this.banner,
    this.avatar,
    this.educations,
    this.freelance,
    this.fullTime,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
