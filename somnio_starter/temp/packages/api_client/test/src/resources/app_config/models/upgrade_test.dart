import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('Upgrade', () {
    const upgrade = Upgrade(
      androidUpgradeUrl: 'https://example.com/android',
      iosUpgradeUrl: 'https://example.com/ios',
      androidBuildNumber: 100,
      iosBuildNumber: 200,
    );

    const upgradeJson = {
      'androidUpgradeUrl': 'https://example.com/android',
      'iosUpgradeUrl': 'https://example.com/ios',
      'androidBuildNumber': 100,
      'iosBuildNumber': 200,
    };

    test('supports value equality', () {
      expect(upgrade, Upgrade.fromJson(upgradeJson));
    });

    test('props are correct', () {
      expect(
        upgrade.props,
        [
          'https://example.com/android',
          'https://example.com/ios',
          100,
          200,
        ],
      );
    });

    test('can be serialized to JSON', () {
      expect(upgrade.toJson(), upgradeJson);
    });

    test('can be deserialized from JSON', () {
      expect(Upgrade.fromJson(upgradeJson), upgrade);
    });
  });
}
