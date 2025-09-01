import 'dart:async';
import 'package:api_client/api_client.dart';
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
    required ApiClient apiClient,
  })  : assert(buildNumber > 0, 'The build number must be greater than 0.'),
        _buildNumber = buildNumber,
        _platform = platform,
        _apiClient = apiClient;

  final ApiClient _apiClient;
  final int _buildNumber;
  final Platform _platform;

  /// Returns a [Stream<bool>] which indicates whether
  /// the current application status is down for maintenance.
  ///
  /// By default, [isDownForMaintenance] will emit `false`
  /// if unable to connected to the backend.
  Stream<bool> isDownForMaintenance() {
    return _apiClient.appConfigResource.getDownForMaintenance().asStream();
  }

  /// Returns a [Stream<ForceUpgrade>] which indicates whether
  /// the current application requires a force upgrade.
  Stream<ForceUpgrade> isForceUpgradeRequired() {
    var isUpgradeRequired = false;
    var upgradeUrl = '';

    _apiClient.appConfigResource.getUpgrade().then((upgrade) {
      if (_platform == Platform.android) {
        isUpgradeRequired = _buildNumber < upgrade.androidBuildNumber;
        upgradeUrl = upgrade.androidUpgradeUrl;
      } else {
        isUpgradeRequired = _buildNumber < upgrade.iosBuildNumber;
        upgradeUrl = upgrade.iosUpgradeUrl;
      }
    });

    return Stream.value(
      ForceUpgrade(
        isUpgradeRequired: isUpgradeRequired,
        upgradeUrl: isUpgradeRequired ? upgradeUrl : '',
      ),
    );
  }
}
