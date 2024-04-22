import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

/// {@template app_config}
/// Application Configuration which contains the relevant
/// information needed to determine whether or not the application is
/// down for maintenance or requires a force upgrade.
/// {@endtemplate}
@JsonSerializable()
class AppConfig extends Equatable {
  /// {@macro app_config}
  const AppConfig({
    required this.androidUpgradeUrl,
    required this.downForMaintenance,
    required this.iosUpgradeUrl,
    required this.minAndroidBuildNumber,
    required this.minIosBuildNumber,
  });

  /// Converts a [Map<String, dynamic>] into an [AppConfig] instance.
  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  /// Whether the app is down for maintenance.
  final bool downForMaintenance;

  /// The minimum supported build number for Android.
  final int minAndroidBuildNumber;

  /// The minimum supported build number for iOS.
  final int minIosBuildNumber;

  /// The upgrade URL for Android.
  final String androidUpgradeUrl;

  /// The upgrade URL for iOS.
  final String iosUpgradeUrl;

  @override
  List<Object> get props => [
        androidUpgradeUrl,
        downForMaintenance,
        iosUpgradeUrl,
        minAndroidBuildNumber,
        minIosBuildNumber,
      ];
}
