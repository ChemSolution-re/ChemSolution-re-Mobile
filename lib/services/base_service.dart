import 'dart:developer';
import 'dart:io';

import 'package:chem_solution/l10n/chem_solution_localizations.dart';
import 'package:chem_solution/services/preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../di/locator.dart';
import '../../exceptions/api_exception.dart';
import '../../exceptions/application_exception.dart';

abstract class BaseService {
  @protected
  final preferencesService = locator<PreferencesService>();

  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    final localizations = await preferencesService.getLocalizations();
    final generalErrorMessage = localizations.generalAppErrorMessage;

    try {
      return await callback();
    } on DioError catch (exception) {
      throw await _getProccessedDioError(exception, localizations);
    } on ApiException {
      rethrow;
    } on ApplicationException {
      rethrow;
    } catch (exception, stackTrace) {
      log(
        generalErrorMessage,
        name: 'BaseService Error',
        error: exception,
        stackTrace: stackTrace,
      );

      throw ApplicationException(generalErrorMessage);
    }
  }

  Future<ApiException> _getProccessedDioError(
    DioError exception,
    ChemSolutionLocalizations localizations,
  ) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException catch (_) {
      return ApiException(
        message: localizations.errorIntenetConnection,
      );
    }

    return ApiException(
      message: localizations.serverErrorMessage,
    );
  }
}
