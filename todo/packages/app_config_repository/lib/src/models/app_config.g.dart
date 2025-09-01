// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return $checkedNew('AppConfig', json, () {
    final val = AppConfig(
      androidUpgradeUrl:
          $checkedConvert(json, 'android_upgrade_url', (v) => v as String),
      downForMaintenance:
          $checkedConvert(json, 'down_for_maintenance', (v) => v as bool),
      iosUpgradeUrl:
          $checkedConvert(json, 'ios_upgrade_url', (v) => v as String),
      minAndroidBuildNumber:
          $checkedConvert(json, 'min_android_build_number', (v) => v as int),
      minIosBuildNumber:
          $checkedConvert(json, 'min_ios_build_number', (v) => v as int),
    );
    return val;
  }, fieldKeyMap: const {
    'androidUpgradeUrl': 'android_upgrade_url',
    'downForMaintenance': 'down_for_maintenance',
    'iosUpgradeUrl': 'ios_upgrade_url',
    'minAndroidBuildNumber': 'min_android_build_number',
    'minIosBuildNumber': 'min_ios_build_number'
  });
}
