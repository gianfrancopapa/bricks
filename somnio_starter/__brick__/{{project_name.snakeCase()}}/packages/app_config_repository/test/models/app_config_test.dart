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
  });
}
