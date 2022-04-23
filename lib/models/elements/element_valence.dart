import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'valence.dart';

part 'element_valence.g.dart';

@JsonSerializable()
class ElementValence extends Equatable {
  final Valence valence;

  const ElementValence(this.valence);

  factory ElementValence.fromJson(Map<String, dynamic> json) {
    return _$ElementValenceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ElementValenceToJson(this);

  @override
  List<Object> get props => [valence];
}
