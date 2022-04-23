import 'package:json_annotation/json_annotation.dart';

enum BlogPostCategory {
  @JsonValue('News')
  news,
  @JsonValue('Crib')
  crib,
}

extension BlogPostCategoryExt on BlogPostCategory {
  String toJson() {
    switch (this) {
      case BlogPostCategory.crib:
        return 'Crib';
      case BlogPostCategory.news:
        return 'News';
    }
  }
}
