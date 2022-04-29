import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_info.g.dart';

@JsonSerializable()
class BlogPostInfo extends Equatable {
  @JsonKey(defaultValue: '')
  final String information;
  @JsonKey(defaultValue: false)
  final bool isLiked;

  const BlogPostInfo({
    required this.information,
    required this.isLiked,
  });

  @override
  List<Object> get props => [information, isLiked];
}
