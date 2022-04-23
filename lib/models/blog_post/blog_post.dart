import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'blog_post_category.dart';

part 'blog_post.g.dart';

@JsonSerializable()
class BlogPost extends Equatable {
  final String blogPostId;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(name: 'blogPostCategory')
  final BlogPostCategory category;
  @JsonKey(defaultValue: '')
  final String information;
  @JsonKey(defaultValue: '')
  final String image;
  final bool isLocked;

  const BlogPost({
    required this.blogPostId,
    required this.title,
    required this.category,
    required this.information,
    required this.image,
    required this.isLocked,
  });

  @override
  List<Object> get props {
    return [
      blogPostId,
      title,
      category,
      information,
      image,
      isLocked,
    ];
  }
}
