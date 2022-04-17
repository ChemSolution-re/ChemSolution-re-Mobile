import 'package:flutter/material.dart';

import '../l10n/chem_solution_localizations.dart';
import '../resources/app_image_resources.dart';
import '../themes/main_theme.dart';

class ChemSolutionAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isLeadingIconEnabled;
  final bool isSearching;
  final VoidCallback? onSearchIconPressed;
  final Widget? titleWidget;

  const ChemSolutionAppBar({
    Key? key,
    this.isLeadingIconEnabled = true,
    this.isSearching = false,
    this.titleWidget,
    this.onSearchIconPressed,
  }) : super(key: key);

  @override
  State<ChemSolutionAppBar> createState() => _ChemSolutionAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChemSolutionAppBarState extends State<ChemSolutionAppBar> {
  @override
  Widget build(BuildContext context) {
    final onSearchIconPressed = widget.onSearchIconPressed;

    return AppBar(
      leading: _buildLeading(),
      centerTitle: false,
      title: widget.titleWidget ??
          Text(
            ChemSolutionLocalizations.of(context).appName,
            style: MainTheme.text(context).appTitle,
          ),
      actions: [
        if (onSearchIconPressed != null)
          IconButton(
            onPressed: onSearchIconPressed,
            icon: Icon(
              widget.isSearching ? Icons.search_off : Icons.search,
            ),
          ),
      ],
    );
  }

  Widget _buildLeading() {
    if (widget.isLeadingIconEnabled) {
      return IconButton(
        onPressed: Navigator.of(context).pop,
        icon: const Icon(Icons.arrow_back_ios_new),
      );
    }
    return Image.asset(AppImageResources.logo);
  }
}
