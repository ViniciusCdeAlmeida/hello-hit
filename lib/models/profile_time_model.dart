import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/index_models.dart';

part 'profile_time_model.g.dart';

@JsonSerializable()
class ProfileTime {
  @JsonKey(name: '_id')
  String id;
  Usuario user;
  List<Skill> skills;
  List<String> categories;
  int hitCount;
  int fanCount;
  int sizeTeam;
  int numMaxMembers;
  List<String> hits;
  List<String> fans;
  List<String> admins;
  List<String> members;
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
  List<Usuario> fansProfile = [];
  List<Usuario> membersProfile = [];
  Categoria category;

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
    this.location,
    this.personalWebsite,
    this.workAvailability,
    this.banner,
    this.avatar,
    this.openOpportunities,
    this.jobHistory,
    this.educations,
    this.posts,
    this.fansProfile,
    this.membersProfile,
    this.category,
  });

  factory ProfileTime.fromJson(Map<String, dynamic> json) => _$ProfileTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileTimeToJson(this);
}
