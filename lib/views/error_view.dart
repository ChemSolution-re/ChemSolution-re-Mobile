import 'package:flutter/material.dart';

import '../l10n/chem_solution_localizations.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onPressed;

  const ErrorView({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ChemSolutionLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            localizations.error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.replay_outlined),
                const SizedBox(width: 4),
                Text(localizations.retry),
              ],
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
