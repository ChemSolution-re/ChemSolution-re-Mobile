import 'package:json_annotation/json_annotation.dart';

enum Valence {
  @JsonValue('One')
  one,
  @JsonValue('Two')
  two,
  @JsonValue('Three')
  three,
  @JsonValue('Four')
  four,
  @JsonValue('Five')
  five,
  @JsonValue('Six')
  six,
  @JsonValue('Seven')
  seven,
  @JsonValue('Eight')
  eight,
}

extension ValenceExt on Valence {
  int get number {
    switch (this) {
      case Valence.one:
        return 1;
      case Valence.two:
        return 2;
      case Valence.three:
        return 3;
      case Valence.four:
        return 4;
      case Valence.five:
        return 5;
      case Valence.six:
        return 6;
      case Valence.seven:
        return 7;
      case Valence.eight:
        return 8;
    }
  }
}
