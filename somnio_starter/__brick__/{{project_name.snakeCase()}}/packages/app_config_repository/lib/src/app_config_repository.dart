import 'dart:async';

import 'package:app_config_repository/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// {@template app_config_repository}
/// Repository which manages determining whether the application
/// is in maintenance mode or needs to be force upgraded.
/// {@endtemplate}
class AppConfigRepository {
  /// {@macro app_config_repository}
  AppConfigRepository({
    required int buildNumber,
    required Platform platform,
    FirebaseFirestore? firestore,
  })  : assert(buildNumber > 0),
        _buildNumber = buildNumber,
        _platform = platform,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  final int _buildNumber;
  final Platform _platform;

  /// Returns a [Stream<bool>] which indicates whether
  /// the current application status is down for maintenance.
  ///
  /// By default, [isDownForMaintenance] will emit `false`
  /// if unable to connected to the backend.
  Stream<bool> isDownForMaintenance() {
    return _firestore
        .doc('global/app_config')
        .snapshots()
        .map(
          (snapshot) => AppConfig.fromJson(snapshot.data()!).downForMaintenance,
        )
        .transform(
          StreamTransformer.fromHandlers(
            handleError: (_, __, sink) => sink.add(false),
          ),
        );
  }

  /// Returns a [Stream<ForceUpgrade>] which indicates whether
  /// the current application requires a force upgrade.
  Stream<ForceUpgrade> isForceUpgradeRequired() {
    return _firestore.doc('global/app_config').snapshots().map((snapshot) {
      final config = AppConfig.fromJson(snapshot.data()!);
      int minBuildNumber;
      String upgradeUrl;
      if (_platform.isAndroid) {
        minBuildNumber = config.minAndroidBuildNumber;
        upgradeUrl = config.androidUpgradeUrl;
      } else {
        minBuildNumber = config.minIosBuildNumber;
        upgradeUrl = config.iosUpgradeUrl;
      }
      return ForceUpgrade(
        isUpgradeRequired: _buildNumber < minBuildNumber,
        upgradeUrl: upgradeUrl,
      );
    }).transform(
      StreamTransformer.fromHandlers(
        handleError: (_, __, sink) => sink.add(
          const ForceUpgrade(isUpgradeRequired: false),
        ),
      ),
    );
  }
}
