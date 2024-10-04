import 'dart:convert';

import 'package:api_client/api_client.dart';

/// {@template app_config_resource}
/// A client for the app config resource.
/// {@endtemplate}
class AppConfigResource {
  /// {@macro app_config_resource}
  AppConfigResource({required HttpApiClient client}) : _client = client;

  final HttpApiClient _client;

  /// The base path for the app config resource.
  static const String kUpgrade = 'app_config/upgrade';

  /// The base path for the app config resource.
  static const String kDownForMaintenance = 'app_config/down_for_maintenance';

  /// Checks if the application is down for maintenance
  Future<bool> getDownForMaintenance() async {
    try {
      final response = await _client.get(kDownForMaintenance);
      if (response.statusCode == 200) {
        final downForMaintenanceString = jsonDecode(response.body);
        return downForMaintenanceString as bool;
      } else {
        throw CheckDownForMaintenanceFailure(
          Exception(
            'Failed to check down for maintenance: '
            '${response.statusCode} ${response.body}',
          ),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      throw CheckDownForMaintenanceFailure(error, stackTrace);
    }
  }

  /// Checks if force upgrade is required
  Future<Upgrade> getUpgrade() async {
    try {
      final response = await _client.get(kUpgrade);
      if (response.statusCode == 200) {
        final upgradeString = jsonDecode(response.body);
        return Upgrade.fromJson(
            Map<String, dynamic>.from(upgradeString as Map),);
      } else {
        throw CheckForceUpgradeFailure(
          Exception(
            'Failed to check force upgrade: '
            '${response.statusCode} ${response.body}',
          ),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      throw CheckForceUpgradeFailure(error, stackTrace);
    }
  }
}
