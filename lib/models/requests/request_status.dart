import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../themes/main_theme.dart';

enum RequestStatus {
  @JsonValue('Сonsider')
  consider,
  @JsonValue('Rejected')
  rejected,
  @JsonValue('Accepted')
  accepted,
}

extension RequestStatusExt on RequestStatus {
  Color getColorBackground(BuildContext context) {
    switch (this) {
      case RequestStatus.consider:
        return ChemSolutionAppTheme.color(context)
            .primaryProfileButtonBackground;
      case RequestStatus.rejected:
        return ChemSolutionAppTheme.color(context).errorToastBackground;
      case RequestStatus.accepted:
        return ChemSolutionAppTheme.color(context).successToastBackground;
    }
  }

  Color getColorForeground(BuildContext context) {
    switch (this) {
      case RequestStatus.consider:
        return Theme.of(context).colorScheme.primary;
      case RequestStatus.rejected:
        return ChemSolutionAppTheme.color(context).errorToastForeground;
      case RequestStatus.accepted:
        return ChemSolutionAppTheme.color(context).successToastForeground;
    }
  }
}
