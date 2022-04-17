import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/logging.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(TState initialState) : super(initialState);

  void handleError(String errorMessage);

  Future<void> makeErrorHandledCall(AsyncCallback callback) async {
    try {
      await callback();
    } catch (exception) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'Error in makeErrorHandledCall()',
        error: exception,
      );
      handleError(exception.toString());
    }
  }
}
