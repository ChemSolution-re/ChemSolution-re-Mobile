import 'package:flutter/material.dart';

import '../themes/main_theme.dart';

class BroqerlyToast {
  final BuildContext context;

  BroqerlyToast.of(this.context);

  SnackBar _buildSnackBar({
    required String message,
    Widget? icon,
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      action: action,
      dismissDirection: DismissDirection.endToStart,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  void showAction({
    required String message,
    required SnackBarAction action,
    Widget? icon,
  }) async {
    final snackBar = _buildSnackBar(
      icon: icon,
      message: message,
      action: action,
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSuccess({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.check_circle_rounded,
        color: MainTheme.color(context).successToastForeground,
      ),
      message: message,
      textColor: MainTheme.color(context).successToastForeground,
      backgroundColor: MainTheme.color(context).successToastBackground,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showError({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.error_outline,
        color: MainTheme.color(context).errorToastForeground,
      ),
      message: message,
      textColor: MainTheme.color(context).errorToastForeground,
      backgroundColor: MainTheme.color(context).errorToastBackground,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
