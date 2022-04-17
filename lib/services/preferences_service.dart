import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../l10n/chem_solution_localizations.dart';

@injectable
@preResolve
class PreferencesService {
  static const _preferencesBox = '_preferencesBox';

  static const _localeKey = '_localeKey';
  static const _accessTokenKey = '_accessTokenKey';

  final Box<dynamic> _box;

  PreferencesService._(this._box);

  @factoryMethod
  static Future<PreferencesService> getInstance() async {
    final box = await Hive.openBox<dynamic>(_preferencesBox);
    return PreferencesService._(box);
  }

  Future<ChemSolutionLocalizations> getLocalizations() async {
    return await ChemSolutionLocalizations.delegate.load(
      getLocale(),
    );
  }

  String getDefaultLanguageCode() {
    if (ChemSolutionLocalizations.supportedLocales
        .contains(Locale(Platform.localeName))) {
      return Platform.localeName;
    }
    return ChemSolutionLocalizations.supportedLocales.first.languageCode;
  }

  Locale getLocale() {
    final languageCode = _box.get(_localeKey) ?? getDefaultLanguageCode();
    return Locale(languageCode);
  }

  Future<void> setLocale(Locale locale) async {
    await _box.put(_localeKey, locale.languageCode);
  }

  ///
  /// Auth Tokens
  ///

  bool get hasToken => getAccessToken().isNotEmpty;

  bool get isTokenExpired {
    final token = getAccessToken();

    if (token.isEmpty) return true;

    return Jwt.isExpired(token);
  }

  bool get isLoggedIn => hasToken && !isTokenExpired;

  String getAccessToken() => _box.get(_accessTokenKey, defaultValue: '');

  Future<void> setAccessToken(String accessToken) async {
    await _box.put(_accessTokenKey, accessToken);
  }

  Future<void> logout() async {
    await _box.delete(_accessTokenKey);
  }
}
