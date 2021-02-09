import 'package:hellohit/models/usuario_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: '_id')
  String id;
  int hits;
  String tip;
  List comments;
  String text;
  String location;
  String event;
  String team;
  Usuario user;
  dynamic file;
  DateTime createdAt;
  DateTime updatedAt;

  Post({
    this.id,
    this.comments,
    this.hits,
    this.tip,
    this.text,
    this.user,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
