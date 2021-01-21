import 'package:hellohit/models/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_model.g.dart';

@JsonSerializable()
class Feed {
  final int id;
  final List<Post> posts;
  final List<int> idPosts;

  Feed({
    this.id,
    this.posts,
    this.idPosts,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
