import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Text shown on the home page
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Text shown when the user logs in successfully
  ///
  /// In en, this message translates to:
  /// **'Log in successful'**
  String get logInSuccessful;

  /// Text shown on the log in button
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// Text shown on the password input
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Text shown on the email input
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Text shown when the user enters an invalid email
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email.'**
  String get invalidEmail;

  /// Text shown when an unknown error occurs
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get unknownError;

  /// Text shown when the user enters a password that is too short
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get signUpPasswordRequirement;

  /// Text shown on the password confirmation input
  ///
  /// In en, this message translates to:
  /// **'Password confirmation'**
  String get signUpPasswordConfirmation;

  /// Text shown when the user enters two different passwords
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get signUpPasswordMismatch;

  /// Text shown on the sign up button
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// Text shown when the user signs up successfully
  ///
  /// In en, this message translates to:
  /// **'Sign up successful.'**
  String get signUpSuccessful;

  /// Text shown on the forgot password button
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// Text shown on the forgot password description
  ///
  /// In en, this message translates to:
  /// **'Please enter your email. We will send you a link to reset your password.'**
  String get forgotPasswordDescription;

  /// Text shown on the reset button
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Text shown when the user resets their password successfully
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent succesfully.'**
  String get resetSuccessful;

  /// Text shown on the name input
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get signUpName;

  /// Text shown when the user enters an invalid name
  ///
  /// In en, this message translates to:
  /// **'Invalid name format.  Please enter a valid name.'**
  String get signUpNameInvalid;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// Text shown on the log out confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logOutConfirmation;

  /// Text shown on the cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Text shown on the delete account button
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// Message shown when the app is down for maintenance
  ///
  /// In en, this message translates to:
  /// **'The app is currently down for maintenance. Please try again later.'**
  String get downForMaintenanceMessage;

  /// Message shown when the app is down for maintenance
  ///
  /// In en, this message translates to:
  /// **'Down For Maintenance'**
  String get downForMaintenance;

  /// Message shown when the app must be updated
  ///
  /// In en, this message translates to:
  /// **'The app is out of date. Please update to the latest version.'**
  String get forceUpgradeMessage;

  /// Message shown when the app must be updated
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get updateRequired;

  /// Confirm text for a button
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// Text shown on the settings button
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Text shown on the terms and conditions button
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// Text shown on the about us button
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// Text shown on the version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Text shown on the contact us button
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
