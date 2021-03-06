import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../models/handled_error.dart';
import '../../services/preferences_service.dart';
import '../base_cubit.dart';

part 'app_control_state.dart';

@injectable
class AppControlCubit extends BaseCubit<AppControlState> {
  final PreferencesService _preferencesService;

  AppControlCubit(
    this._preferencesService,
    @factoryParam AppControlState? initialState,
  ) : super(initialState!);

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(error: error));
  }

  Future<void> setLocale(Locale locale) async {
    await makeErrorHandledCall(() async {
      await _preferencesService.setLocale(locale);
      emit(state.copyWith(locale: locale));
    });
  }
}
