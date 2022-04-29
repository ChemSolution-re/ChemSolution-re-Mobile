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

  const BlogPostInfo.empty()
      : information = '',
        isLiked = false;

  factory BlogPostInfo.fromJson(Map<String, dynamic> json) {
    return _$BlogPostInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlogPostInfoToJson(this);

  @override
  List<Object> get props => [information, isLiked];
}
