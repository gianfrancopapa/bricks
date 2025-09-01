import 'package:api_client/api_client.dart';

/// {@template app_config_exception}
/// Base class for all [AppConfigResource] exceptions.
/// {@endtemplate}
abstract class AppConfigException implements Exception {
  /// {@macro app_config_exception}
  const AppConfigException(this.error, this.stackTrace);

  /// The error which was caught.
  final Object error;

  /// The error stack trace.
  final StackTrace stackTrace;
}

/// {@template check_force_upgrade_failure}
/// Thrown during the check force upgrade process if a failure occurs.
/// {@endtemplate}
class CheckForceUpgradeFailure extends UserException {
  /// {@macro check_force_upgrade_failure}
  const CheckForceUpgradeFailure(super.error, super.stackTrace);
}

/// {@template check_down_for_maintenance_failure}
/// Thrown during the check down for maintenance process if a failure occurs.
/// {@endtemplate}
class CheckDownForMaintenanceFailure extends UserException {
  /// {@macro check_down_for_maintenance_failure}
  const CheckDownForMaintenanceFailure(super.error, super.stackTrace);
}
