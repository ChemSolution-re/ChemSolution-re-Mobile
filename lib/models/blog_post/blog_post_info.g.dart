// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostInfo _$BlogPostInfoFromJson(Map<String, dynamic> json) => BlogPostInfo(
      information: json['information'] as String? ?? '',
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$BlogPostInfoToJson(BlogPostInfo instance) =>
    <String, dynamic>{
      'information': instance.information,
      'isLiked': instance.isLiked,
    };
