import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/index_models.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: '_id')
  String id;
  Usuario user;
  List<Skill> skills;
  List experiences;
  List<String> categories;
  Categoria category;
  List<String> hits;
  List<String> teams;
  List<String> fans;
  int fansCount;
  int hitCount;
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
  List<Usuario> fansProfile = [];

  Profile({
    this.id,
    this.user,
    this.skills,
    this.experiences,
    this.categories,
    this.hits,
    this.teams,
    this.fans,
    this.fansCount,
    this.hitCount,
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
    this.fansProfile,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
