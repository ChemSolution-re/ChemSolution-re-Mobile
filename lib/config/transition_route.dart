import 'package:flutter/material.dart';

class SlideFadeTransitionRoute<T> extends MaterialPageRoute<T> {
  SlideFadeTransitionRoute({
    required WidgetBuilder builder,
  }) : super(builder: builder);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class FadeTransitionRoute<T> extends PageRouteBuilder<T> {
  FadeTransitionRoute({
    required RoutePageBuilder builder,
  }) : super(pageBuilder: builder);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
