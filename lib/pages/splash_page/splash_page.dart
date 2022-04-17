import 'dart:async';

import 'package:flutter/material.dart';

import '../../themes/main_theme.dart';
import '../../views/animated_logo.dart';
import '../main_page/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Timer _exitTimer;

  @override
  void initState() {
    super.initState();
    _exitTimer = Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MainPage.getRoute(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _exitTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.color(context).primaryBackground,
      body: const Center(
        child: AnimatedLogo(
          height: 200,
        ),
      ),
    );
  }
}
