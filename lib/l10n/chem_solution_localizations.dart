
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'chem_solution_localizations_uk.dart';

/// Callers can lookup localized strings with an instance of ChemSolutionLocalizations returned
/// by `ChemSolutionLocalizations.of(context)`.
///
/// Applications need to include `ChemSolutionLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/chem_solution_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ChemSolutionLocalizations.localizationsDelegates,
///   supportedLocales: ChemSolutionLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ChemSolutionLocalizations.supportedLocales
/// property.
abstract class ChemSolutionLocalizations {
  ChemSolutionLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ChemSolutionLocalizations of(BuildContext context) {
    return Localizations.of<ChemSolutionLocalizations>(context, ChemSolutionLocalizations)!;
  }

  static const LocalizationsDelegate<ChemSolutionLocalizations> delegate = _ChemSolutionLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('uk')
  ];

  /// No description provided for @appName.
  ///
  /// In uk, this message translates to:
  /// **'ChemSolution'**
  String get appName;

  /// No description provided for @generalAppErrorMessage.
  ///
  /// In uk, this message translates to:
  /// **'Сталася помилка з боку мобільного клієнту'**
  String get generalAppErrorMessage;

  /// No description provided for @errorIntenetConnection.
  ///
  /// In uk, this message translates to:
  /// **'Помилка підключення до Інтернету'**
  String get errorIntenetConnection;

  /// No description provided for @serverErrorMessage.
  ///
  /// In uk, this message translates to:
  /// **'Сталася серверна помилка'**
  String get serverErrorMessage;

  /// No description provided for @elements.
  ///
  /// In uk, this message translates to:
  /// **'Елементи'**
  String get elements;

  /// No description provided for @newsAnsFacts.
  ///
  /// In uk, this message translates to:
  /// **'Новини та факти'**
  String get newsAnsFacts;

  /// No description provided for @cribs.
  ///
  /// In uk, this message translates to:
  /// **'Шпаргалки'**
  String get cribs;

  /// No description provided for @myProfile.
  ///
  /// In uk, this message translates to:
  /// **'Мій профіль'**
  String get myProfile;

  /// No description provided for @error.
  ///
  /// In uk, this message translates to:
  /// **'Відбулася помилка'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In uk, this message translates to:
  /// **'Повторити'**
  String get retry;

  /// No description provided for @elementId.
  ///
  /// In uk, this message translates to:
  /// **'Порядковий номер'**
  String get elementId;

  /// No description provided for @symbol.
  ///
  /// In uk, this message translates to:
  /// **'Позначення'**
  String get symbol;

  /// No description provided for @name.
  ///
  /// In uk, this message translates to:
  /// **'Назва'**
  String get name;

  /// No description provided for @category.
  ///
  /// In uk, this message translates to:
  /// **'Категорія'**
  String get category;

  /// No description provided for @atomWeight.
  ///
  /// In uk, this message translates to:
  /// **'Атомна маса'**
  String get atomWeight;

  /// No description provided for @valency.
  ///
  /// In uk, this message translates to:
  /// **'Валентність'**
  String get valency;

  /// No description provided for @alkaliMetals.
  ///
  /// In uk, this message translates to:
  /// **'Лужні метали'**
  String get alkaliMetals;

  /// No description provided for @alkalineEarthMetals.
  ///
  /// In uk, this message translates to:
  /// **'Лужно-земельні метали'**
  String get alkalineEarthMetals;

  /// No description provided for @transitionMetals.
  ///
  /// In uk, this message translates to:
  /// **'Перехідні метали'**
  String get transitionMetals;

  /// No description provided for @lanthanides.
  ///
  /// In uk, this message translates to:
  /// **'Лантаноїди'**
  String get lanthanides;

  /// No description provided for @actinoids.
  ///
  /// In uk, this message translates to:
  /// **'Актиноїди'**
  String get actinoids;

  /// No description provided for @semiMetals.
  ///
  /// In uk, this message translates to:
  /// **'Напівметали'**
  String get semiMetals;

  /// No description provided for @postTransitionMetals.
  ///
  /// In uk, this message translates to:
  /// **'Постперехідні метали'**
  String get postTransitionMetals;

  /// No description provided for @nobleGases.
  ///
  /// In uk, this message translates to:
  /// **'Благородні гази'**
  String get nobleGases;

  /// No description provided for @nonMetals.
  ///
  /// In uk, this message translates to:
  /// **'Неметали'**
  String get nonMetals;

  /// No description provided for @unknown.
  ///
  /// In uk, this message translates to:
  /// **'Невідомо'**
  String get unknown;

  /// No description provided for @readMore.
  ///
  /// In uk, this message translates to:
  /// **'Детальніше...'**
  String get readMore;

  /// No description provided for @auth.
  ///
  /// In uk, this message translates to:
  /// **'Авторизація'**
  String get auth;

  /// No description provided for @nd.
  ///
  /// In uk, this message translates to:
  /// **'Н/Д'**
  String get nd;

  /// No description provided for @register.
  ///
  /// In uk, this message translates to:
  /// **'Реєстрація'**
  String get register;

  /// No description provided for @email.
  ///
  /// In uk, this message translates to:
  /// **'Електронна пошта'**
  String get email;

  /// No description provided for @password.
  ///
  /// In uk, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In uk, this message translates to:
  /// **'Вхід'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In uk, this message translates to:
  /// **'Зареєструватися'**
  String get signUp;

  /// No description provided for @forgetPassword.
  ///
  /// In uk, this message translates to:
  /// **'Забули пароль?'**
  String get forgetPassword;

  /// No description provided for @youAreAuth.
  ///
  /// In uk, this message translates to:
  /// **'Ви успішно авторизовані'**
  String get youAreAuth;

  /// No description provided for @emailValidator.
  ///
  /// In uk, this message translates to:
  /// **'Некоректний email: має містити домен пошти, букви латинського алфавіту, цифри та не містити пробілів'**
  String get emailValidator;

  /// No description provided for @passwordValidator.
  ///
  /// In uk, this message translates to:
  /// **'Пароль повинен мати не менше за 7 символів та не більше за 32 серед яких: літери верхнього й нижнього регістру, хоча б одна цифра або спеціальний символ'**
  String get passwordValidator;

  /// No description provided for @restorePassword.
  ///
  /// In uk, this message translates to:
  /// **'Відновлення паролю'**
  String get restorePassword;

  /// No description provided for @restore.
  ///
  /// In uk, this message translates to:
  /// **'Відновити'**
  String get restore;

  /// No description provided for @doneSuccessCheckEmail.
  ///
  /// In uk, this message translates to:
  /// **'Успішно! Перевірте вашу пошту'**
  String get doneSuccessCheckEmail;

  /// No description provided for @username.
  ///
  /// In uk, this message translates to:
  /// **'Імʼя користувача'**
  String get username;

  /// No description provided for @birthday.
  ///
  /// In uk, this message translates to:
  /// **'Дата народження'**
  String get birthday;

  /// No description provided for @requiredField.
  ///
  /// In uk, this message translates to:
  /// **'Поле обовʼязкове для заповнення'**
  String get requiredField;

  /// No description provided for @saved.
  ///
  /// In uk, this message translates to:
  /// **'Збережене'**
  String get saved;

  /// No description provided for @achievemens.
  ///
  /// In uk, this message translates to:
  /// **'Досягнення'**
  String get achievemens;

  /// No description provided for @requests.
  ///
  /// In uk, this message translates to:
  /// **'Запити'**
  String get requests;

  /// No description provided for @openedMaterials.
  ///
  /// In uk, this message translates to:
  /// **'Відкриті речовини'**
  String get openedMaterials;

  /// No description provided for @logout.
  ///
  /// In uk, this message translates to:
  /// **'Вихід'**
  String get logout;

  /// No description provided for @nothingFind.
  ///
  /// In uk, this message translates to:
  /// **'Нічого не знайдено'**
  String get nothingFind;

  /// No description provided for @youShouldBeAuth.
  ///
  /// In uk, this message translates to:
  /// **'Для перегляду інформації авторизуйтесь'**
  String get youShouldBeAuth;

  /// No description provided for @youShouldBuyElement.
  ///
  /// In uk, this message translates to:
  /// **'Для перегляду інформації придбайте елемент'**
  String get youShouldBuyElement;

  /// No description provided for @atomicWeight.
  ///
  /// In uk, this message translates to:
  /// **'Атомна маса'**
  String get atomicWeight;

  /// No description provided for @neutronQuantity.
  ///
  /// In uk, this message translates to:
  /// **'Кількість нейтронів'**
  String get neutronQuantity;

  /// No description provided for @atomicRadius.
  ///
  /// In uk, this message translates to:
  /// **'Атомний радіус'**
  String get atomicRadius;

  /// No description provided for @electronegativity.
  ///
  /// In uk, this message translates to:
  /// **'Електронегативність'**
  String get electronegativity;

  /// No description provided for @energyLevels.
  ///
  /// In uk, this message translates to:
  /// **'Енергетичні рівні'**
  String get energyLevels;

  /// No description provided for @meltingTemperature.
  ///
  /// In uk, this message translates to:
  /// **'Температура плавлення'**
  String get meltingTemperature;

  /// No description provided for @boilingTemperature.
  ///
  /// In uk, this message translates to:
  /// **'Температура кипіння'**
  String get boilingTemperature;

  /// No description provided for @valences.
  ///
  /// In uk, this message translates to:
  /// **'Валентність'**
  String get valences;

  /// No description provided for @info.
  ///
  /// In uk, this message translates to:
  /// **'Загальна інформація'**
  String get info;

  /// No description provided for @basicOxides.
  ///
  /// In uk, this message translates to:
  /// **'Основні оксиди'**
  String get basicOxides;

  /// No description provided for @acidOxides.
  ///
  /// In uk, this message translates to:
  /// **'Кислотні оксиди'**
  String get acidOxides;

  /// No description provided for @amphotericOxides.
  ///
  /// In uk, this message translates to:
  /// **'Амфотерні оксиди'**
  String get amphotericOxides;

  /// No description provided for @alkalis.
  ///
  /// In uk, this message translates to:
  /// **'Луги'**
  String get alkalis;

  /// No description provided for @insolubleBases.
  ///
  /// In uk, this message translates to:
  /// **'Нерозчинні основи'**
  String get insolubleBases;

  /// No description provided for @amphotericBases.
  ///
  /// In uk, this message translates to:
  /// **'Амфотерні основи'**
  String get amphotericBases;

  /// No description provided for @acids.
  ///
  /// In uk, this message translates to:
  /// **'Кислоти'**
  String get acids;

  /// No description provided for @salts.
  ///
  /// In uk, this message translates to:
  /// **'Солі'**
  String get salts;

  /// No description provided for @acidicSalts.
  ///
  /// In uk, this message translates to:
  /// **'Кислотні солі'**
  String get acidicSalts;

  /// No description provided for @basicSalts.
  ///
  /// In uk, this message translates to:
  /// **'Основні солі'**
  String get basicSalts;

  /// No description provided for @peroxides.
  ///
  /// In uk, this message translates to:
  /// **'Пероксиди'**
  String get peroxides;

  /// No description provided for @simpleMaterials.
  ///
  /// In uk, this message translates to:
  /// **'Прості речовини'**
  String get simpleMaterials;

  /// No description provided for @coins.
  ///
  /// In uk, this message translates to:
  /// **'Монети'**
  String get coins;

  /// No description provided for @rating.
  ///
  /// In uk, this message translates to:
  /// **'Рейтинг'**
  String get rating;
}

class _ChemSolutionLocalizationsDelegate extends LocalizationsDelegate<ChemSolutionLocalizations> {
  const _ChemSolutionLocalizationsDelegate();

  @override
  Future<ChemSolutionLocalizations> load(Locale locale) {
    return SynchronousFuture<ChemSolutionLocalizations>(lookupChemSolutionLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_ChemSolutionLocalizationsDelegate old) => false;
}

ChemSolutionLocalizations lookupChemSolutionLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'uk': return ChemSolutionLocalizationsUk();
  }

  throw FlutterError(
    'ChemSolutionLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
