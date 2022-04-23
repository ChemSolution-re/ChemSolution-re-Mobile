// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPost _$BlogPostFromJson(Map<String, dynamic> json) => BlogPost(
      blogPostId: json['blogPostId'] as String,
      title: json['title'] as String? ?? '',
      category:
          $enumDecode(_$BlogPostCategoryEnumMap, json['blogPostCategory']),
      information: json['information'] as String? ?? '',
      image: json['image'] as String? ?? '',
      isLocked: json['isLocked'] as bool,
    );

Map<String, dynamic> _$BlogPostToJson(BlogPost instance) => <String, dynamic>{
      'blogPostId': instance.blogPostId,
      'title': instance.title,
      'blogPostCategory': _$BlogPostCategoryEnumMap[instance.category],
      'information': instance.information,
      'image': instance.image,
      'isLocked': instance.isLocked,
    };

const _$BlogPostCategoryEnumMap = {
  BlogPostCategory.news: 'News',
  BlogPostCategory.crib: 'Crib',
};
