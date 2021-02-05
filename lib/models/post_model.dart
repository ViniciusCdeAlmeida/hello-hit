import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  String id;
  int hits;
  String tip;
  List comments;
  final String text;
  dynamic user;
  final dynamic file;

  Post({
    this.id,
    this.comments,
    this.hits,
    this.tip,
    this.text,
    this.user,
    this.file,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
