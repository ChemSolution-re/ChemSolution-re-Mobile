import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_control/app_control_cubit.dart';
import 'di/locator.dart';
import 'l10n/chem_solution_localizations.dart';
import 'pages/splash_page/splash_page.dart';
import 'themes/light/light_theme.dart';
import 'themes/main_theme.dart';
import 'utils/chem_solution_toasts.dart';

class ChemSolutionApp extends StatelessWidget {
  static Widget create(Locale locale, bool isLoggedIn) {
    final initialControlState = AppControlState(
      locale: locale,
      isLoggedIn: isLoggedIn,
    );
    return BlocProvider<AppControlCubit>(
      create: (_) => locator.get(param1: initialControlState),
      child: const ChemSolutionApp._(),
    );
  }

  const ChemSolutionApp._({Key? key}) : super(key: key);

  void _onStateChanged(
    BuildContext context,
    AppControlState state,
  ) {
    if (state.error.errorMessage.isNotEmpty) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppControlCubit, AppControlState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return ChemSolutionAppTheme(
          theme: LightThemeData(),
          child: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                locale: state.locale,
                debugShowCheckedModeBanner: false,
                theme: ChemSolutionAppTheme.of(context).themeData,
                localizationsDelegates:
                    ChemSolutionLocalizations.localizationsDelegates,
                supportedLocales: ChemSolutionLocalizations.supportedLocales,
                home: const SplashPage(),
              );
            },
          ),
        );
      },
    );
  }
}
