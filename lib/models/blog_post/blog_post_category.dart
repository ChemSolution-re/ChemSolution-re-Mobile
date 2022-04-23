import 'package:json_annotation/json_annotation.dart';

enum BlogPostCategory {
  @JsonValue('News')
  news,
  @JsonValue('Crib')
  crib,
}
