import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/work_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/categoria_model.dart';
import 'package:hellohit/models/educacao_model.dart';
import 'package:hellohit/models/historicoJob_model.dart';
import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/premio_model.dart';
import 'package:hellohit/models/skill_model.dart';
import 'package:hellohit/models/usuario_model.dart';

part 'profile_time_model.g.dart';

@JsonSerializable()
class ProfileTime {
  @JsonKey(name: '_id')
  String id;
  Usuario user;
  List<Skill> skills;
  List<Categoria> categories;
  int hitCount;
  int fanCount;
  int sizeTeam;
  int numMaxMembers;
  List<Usuario> hits;
  List<Usuario> fans;
  List<Usuario> admins;
  List<Usuario> members;
  List<Premio> awards;
  String bio;
  String location;
  String personalWebsite;
  Work workAvailability;
  String banner;
  String avatar;
  List<Oportunidade> openOpportunities;
  List<HistoricoJob> jobHistory;
  List<Educacao> educations;
  List<Post> posts;

  ProfileTime({
    this.id,
    this.user,
    this.skills,
    this.categories,
    this.hitCount,
    this.fanCount,
    this.sizeTeam,
    this.numMaxMembers,
    this.hits,
    this.fans,
    this.admins,
    this.members,
    this.awards,
    this.bio,
    this.posts,
    this.location,
    this.personalWebsite,
    this.workAvailability,
    this.banner,
    this.avatar,
    this.openOpportunities,
    this.jobHistory,
    this.educations,
  });

  factory ProfileTime.fromJson(Map<String, dynamic> json) =>
      _$ProfileTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileTimeToJson(this);
}
