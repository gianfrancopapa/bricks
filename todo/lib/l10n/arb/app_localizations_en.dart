// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get logInSuccessful => 'Log in successful';

  @override
  String get logIn => 'Log in';

  @override
  String get password => 'Password';

  @override
  String get email => 'Email';

  @override
  String get invalidEmail => 'Please enter a valid email.';

  @override
  String get unknownError => 'Something went wrong.';

  @override
  String get signUpPasswordRequirement =>
      'Password must be at least 6 characters long.';

  @override
  String get signUpPasswordConfirmation => 'Password confirmation';

  @override
  String get signUpPasswordMismatch => 'Passwords do not match.';

  @override
  String get signUp => 'Sign up';

  @override
  String get signUpSuccessful => 'Sign up successful.';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get forgotPasswordDescription =>
      'Please enter your email. We will send you a link to reset your password.';

  @override
  String get reset => 'Reset';

  @override
  String get resetSuccessful => 'Password reset email sent succesfully.';

  @override
  String get signUpName => 'Name';

  @override
  String get signUpNameInvalid =>
      'Invalid name format.  Please enter a valid name.';

  @override
  String get logOut => 'Log out';

  @override
  String get logOutConfirmation => 'Are you sure you want to log out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get downForMaintenanceMessage =>
      'The app is currently down for maintenance. Please try again later.';

  @override
  String get downForMaintenance => 'Down For Maintenance';

  @override
  String get forceUpgradeMessage =>
      'The app is out of date. Please update to the latest version.';

  @override
  String get updateRequired => 'Update Required';

  @override
  String get ok => 'Ok';

  @override
  String get settings => 'Settings';

  @override
  String get termsAndConditions => 'Terms and Conditions';

  @override
  String get aboutUs => 'About Us';

  @override
  String get version => 'Version';

  @override
  String get contactUs => 'Contact Us';
}
