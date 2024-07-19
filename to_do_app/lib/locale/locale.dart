import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'locale_az.dart';
import 'locale_en.dart';
import 'locale_ru.dart';

/// Callers can lookup localized strings with an instance of LocalizationService
/// returned by `LocalizationService.of(context)`.
///
/// Applications need to include `LocalizationService.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'locale/locale.dart';
///
/// return MaterialApp(
///   localizationsDelegates: LocalizationService.localizationsDelegates,
///   supportedLocales: LocalizationService.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
/// be consistent with the languages listed in the LocalizationService.supportedLocales
/// property.
abstract class LocalizationService {
  LocalizationService(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static LocalizationService? of(BuildContext context) {
    return Localizations.of<LocalizationService>(context, LocalizationService);
  }

  static const LocalizationsDelegate<LocalizationService> delegate = _LocalizationServiceDelegate();

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
    Locale('az'),
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcome_back;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @manage_daily_tasks.
  ///
  /// In en, this message translates to:
  /// **'Manage Daily tasks'**
  String get manage_daily_tasks;

  /// No description provided for @today_tasks.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Tasks'**
  String get today_tasks;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get see_all;

  /// No description provided for @no_tasks_for_today.
  ///
  /// In en, this message translates to:
  /// **'No tasks for today'**
  String get no_tasks_for_today;

  /// No description provided for @no_tasks_available.
  ///
  /// In en, this message translates to:
  /// **'No tasks available'**
  String get no_tasks_available;

  /// No description provided for @start_time.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get start_time;

  /// No description provided for @end_time.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get end_time;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @edit_image_and_name.
  ///
  /// In en, this message translates to:
  /// **'Edit image and name'**
  String get edit_image_and_name;

  /// No description provided for @user_feedback.
  ///
  /// In en, this message translates to:
  /// **'User feedback'**
  String get user_feedback;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @change_theme.
  ///
  /// In en, this message translates to:
  /// **'Change theme'**
  String get change_theme;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get change_language;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @add_task.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get add_task;

  /// No description provided for @task_name.
  ///
  /// In en, this message translates to:
  /// **'Task name'**
  String get task_name;

  /// No description provided for @working.
  ///
  /// In en, this message translates to:
  /// **'Working'**
  String get working;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @select_category.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get select_category;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @start_task.
  ///
  /// In en, this message translates to:
  /// **'It\'s time to complete the task'**
  String get start_task;

  /// No description provided for @end_task.
  ///
  /// In en, this message translates to:
  /// **'Task timed out'**
  String get end_task;

  /// No description provided for @your_task.
  ///
  /// In en, this message translates to:
  /// **'Your task'**
  String get your_task;

  /// No description provided for @time_is_starting_now.
  ///
  /// In en, this message translates to:
  /// **'time is starting now!'**
  String get time_is_starting_now;

  /// No description provided for @time_has_ended.
  ///
  /// In en, this message translates to:
  /// **'time has ended'**
  String get time_has_ended;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @choose_avatar.
  ///
  /// In en, this message translates to:
  /// **'Choose avatar'**
  String get choose_avatar;

  /// No description provided for @small_steps_big_dreams.
  ///
  /// In en, this message translates to:
  /// **'Small Steps, Big Dreams'**
  String get small_steps_big_dreams;

  /// No description provided for @stay_strong.
  ///
  /// In en, this message translates to:
  /// **'Stay strong'**
  String get stay_strong;

  /// No description provided for @conquer_the_challenge.
  ///
  /// In en, this message translates to:
  /// **'Conquer the Challenge'**
  String get conquer_the_challenge;
}

class _LocalizationServiceDelegate extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationServiceDelegate();

  @override
  Future<LocalizationService> load(Locale locale) {
    return SynchronousFuture<LocalizationService>(lookupLocalizationService(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['az', 'en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_LocalizationServiceDelegate old) => false;
}

LocalizationService lookupLocalizationService(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az': return LocalizationServiceAz();
    case 'en': return LocalizationServiceEn();
    case 'ru': return LocalizationServiceRu();
  }

  throw FlutterError(
    'LocalizationService.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
