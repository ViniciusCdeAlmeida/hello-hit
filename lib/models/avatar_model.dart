import 'package:json_annotation/json_annotation.dart';

part 'avatar_model.g.dart';

@JsonSerializable()
class Avatar {
  String url;
  Avatar({
    this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
