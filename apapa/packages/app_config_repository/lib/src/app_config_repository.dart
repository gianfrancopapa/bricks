import 'dart:async';

import 'package:app_config_repository/src/models/models.dart';

/// {@template app_config_repository}
/// Repository which manages determining whether the application
/// is in maintenance mode or needs to be force upgraded.
/// {@endtemplate}
class AppConfigRepository {
  /// {@macro app_config_repository}
  AppConfigRepository({
    required int buildNumber,
    required Platform platform,
  })  : assert(buildNumber > 0, 'The build number must be greater than 0.'),
        _buildNumber = buildNumber,
        _platform = platform;

  final int _buildNumber;
  final Platform _platform;

  /// Returns a [Stream<bool>] which indicates whether
  /// the current application status is down for maintenance.
  ///
  /// By default, [isDownForMaintenance] will emit `false`
  /// if unable to connected to the backend.
  Stream<bool> isDownForMaintenance() {
    final isMaintenanceRequired = _buildNumber < 100;
    return Stream.value(isMaintenanceRequired);
  }

  /// Returns a [Stream<ForceUpgrade>] which indicates whether
  /// the current application requires a force upgrade.
  Stream<ForceUpgrade> isForceUpgradeRequired() {
    bool isUpgradeRequired;
    String upgradeUrl;

    if (_platform == Platform.android) {
      isUpgradeRequired = _buildNumber < 200;
      upgradeUrl = 'https://example.com/upgrade/android';
    } else {
      isUpgradeRequired = _buildNumber < 150;
      upgradeUrl = 'https://example.com/upgrade/ios';
    }

    return Stream.value(
      ForceUpgrade(
        isUpgradeRequired: isUpgradeRequired,
        upgradeUrl: isUpgradeRequired ? upgradeUrl : '',
      ),
    );
  }
}
