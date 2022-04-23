import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'valence.dart';

part 'element_valence.g.dart';

@JsonSerializable()
class ElementValence extends Equatable {
  final Valence valence;

  const ElementValence(this.valence);

  @override
  List<Object> get props => [valence];
}
