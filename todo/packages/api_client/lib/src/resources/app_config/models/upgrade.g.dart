// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Upgrade _$UpgradeFromJson(Map<String, dynamic> json) => Upgrade(
      androidUpgradeUrl: json['androidUpgradeUrl'] as String,
      iosUpgradeUrl: json['iosUpgradeUrl'] as String,
      androidBuildNumber: (json['androidBuildNumber'] as num).toInt(),
      iosBuildNumber: (json['iosBuildNumber'] as num).toInt(),
    );

Map<String, dynamic> _$UpgradeToJson(Upgrade instance) => <String, dynamic>{
      'androidUpgradeUrl': instance.androidUpgradeUrl,
      'iosUpgradeUrl': instance.iosUpgradeUrl,
      'androidBuildNumber': instance.androidBuildNumber,
      'iosBuildNumber': instance.iosBuildNumber,
    };
