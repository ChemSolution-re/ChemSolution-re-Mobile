import 'package:flutter/material.dart';

import '../l10n/chem_solution_localizations.dart';

String? Function(String?) passwordValidator(BuildContext context) {
  return (password) {
    final expression = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9#?!@$%^&*-]).{8,32}$',
    );
    final matches = expression.hasMatch(password ?? '');

    if (!matches) {
      return ChemSolutionLocalizations.of(context).passwordValidator;
    }
    return null;
  };
}
