import 'package:app_config_repository/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConfig', () {
    test('equatable props', () {
      const appConfig1 = AppConfig(
        androidUpgradeUrl: 'https://example.com/android',
        downForMaintenance: true,
        iosUpgradeUrl: 'https://example.com/ios',
        minAndroidBuildNumber: 100,
        minIosBuildNumber: 200,
      );

      const appConfig2 = AppConfig(
        androidUpgradeUrl: 'https://example.com/android',
        downForMaintenance: true,
        iosUpgradeUrl: 'https://example.com/ios',
        minAndroidBuildNumber: 100,
        minIosBuildNumber: 200,
      );

      const appConfig3 = AppConfig(
        androidUpgradeUrl: 'https://different-url.com/android',
        downForMaintenance: true,
        iosUpgradeUrl: 'https://example.com/ios',
        minAndroidBuildNumber: 100,
        minIosBuildNumber: 200,
      );

      expect(appConfig1, equals(appConfig2));
      expect(appConfig1 == appConfig3, isFalse);
    });

    test('fromJson', () {
      final json = <String, dynamic>{
        'android_upgrade_url': 'https://example.com/android',
        'down_for_maintenance': true,
        'ios_upgrade_url': 'https://example.com/ios',
        'min_android_build_number': 100,
        'min_ios_build_number': 100,
      };

      final appConfig = AppConfig.fromJson(json);

      expect(appConfig.androidUpgradeUrl, equals(json['android_upgrade_url']));
      expect(
        appConfig.downForMaintenance,
        equals(json['down_for_maintenance']),
      );
      expect(appConfig.iosUpgradeUrl, equals(json['ios_upgrade_url']));
      expect(
        appConfig.minAndroidBuildNumber,
        equals(json['min_android_build_number']),
      );
      expect(appConfig.minIosBuildNumber, equals(json['min_ios_build_number']));
    });

    test('supports value equality', () {
      const appConfig = AppConfig(
        androidUpgradeUrl: 'https://example.com/android',
        downForMaintenance: true,
        iosUpgradeUrl: 'https://example.com/ios',
        minAndroidBuildNumber: 100,
        minIosBuildNumber: 200,
      );
      const secondAppConfig = AppConfig(
        androidUpgradeUrl: 'https://example.com/android',
        downForMaintenance: true,
        iosUpgradeUrl: 'https://example.com/ios',
        minAndroidBuildNumber: 100,
        minIosBuildNumber: 200,
      );
      const appConfig2 = AppConfig(
        androidUpgradeUrl: 'https://different-url.com/android',
        downForMaintenance: false,
        iosUpgradeUrl: 'https://example.com/ios',
        minAndroidBuildNumber: 200,
        minIosBuildNumber: 200,
      );

      expect(appConfig, equals(secondAppConfig));
      expect(appConfig, isNot(equals(appConfig2)));
    });
  });
}
