import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/categoria_model.dart';
import 'package:hellohit/models/educacao_model.dart';
import 'package:hellohit/models/historicoJob_model.dart';
import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/skill_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/models/work_model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: '_id')
  String id;
  Usuario user;
  List<Skill> skills;
  List experiences;
  List<String> categories;
  int hitsCount;
  List<Usuario> hits;
  List<Usuario> teams;
  String location;
  String bio;
  String personalWebsite;
  Work workAvailability;
  String banner;
  String avatar;
  List<Oportunidade> openOpportunities;
  List<HistoricoJob> jobHistory;
  List<Educacao> educations;
  List<Post> posts;

  Profile({
    this.id,
    this.user,
    this.skills,
    this.experiences,
    this.categories,
    this.hitsCount,
    this.hits,
    this.teams,
    this.location,
    this.bio,
    this.personalWebsite,
    this.workAvailability,
    this.banner,
    this.avatar,
    this.openOpportunities,
    this.jobHistory,
    this.educations,
    this.posts,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
