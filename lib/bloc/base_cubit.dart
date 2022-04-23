import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../exceptions/api_exception.dart';
import '../models/handled_error.dart';
import '../utils/logging.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(TState initialState) : super(initialState);

  void handleError(HandledError error);

  Future<void> makeErrorHandledCall(AsyncCallback callback) async {
    try {
      await callback();
    } on ApiException catch (exception) {
      handleError(HandledError(
        errorMessage: exception.toString(),
        stausCode: exception.statusCode,
      ));
    } catch (exception) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'Error in makeErrorHandledCall()',
        error: exception,
      );
      handleError(HandledError(errorMessage: exception.toString()));
    }
  }
}
