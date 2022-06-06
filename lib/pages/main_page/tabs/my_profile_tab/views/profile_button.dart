import 'package:flutter/material.dart';

import '../../../../../themes/main_theme.dart';

enum _ProfileButtonType {
  primary,
  secondary,
}

class ProfileButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;
  final _ProfileButtonType _type;

  const ProfileButton.primary({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onPressed,
  })  : _type = _ProfileButtonType.primary,
        super(key: key);

  const ProfileButton.secondary({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onPressed,
  })  : _type = _ProfileButtonType.secondary,
        super(key: key);

  Color getColor(BuildContext context) {
    switch (_type) {
      case _ProfileButtonType.primary:
        return ChemSolutionAppTheme.color(context)
            .primaryProfileButtonBackground;
      case _ProfileButtonType.secondary:
        return ChemSolutionAppTheme.color(context)
            .secondaryProfileButtonBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        tileColor: getColor(context),
        onTap: onPressed,
        contentPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Icon(
          iconData,
          size: 32,
        ),
        title: Text(
          title,
          style: ChemSolutionAppTheme.text(context).profileButtonTitle,
        ),
      ),
    );
  }
}
