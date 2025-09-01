import 'package:app_config_repository/app_config_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Platform', () {
    test('isAndroid should return true for Platform.android', () {
      expect(Platform.android.isAndroid, isTrue);
      expect(Platform.android.isIos, isFalse);
    });

    test('isIos should return true for Platform.iOS', () {
      expect(Platform.iOS.isAndroid, isFalse);
      expect(Platform.iOS.isIos, isTrue);
    });

    test('Platform equality', () {
      expect(Platform.android, equals(Platform.android));
      expect(Platform.iOS, equals(Platform.iOS));
      expect(Platform.android == Platform.iOS, isFalse);
    });
  });

  group('ForceUpgrade', () {
    test('equality', () {
      const upgrade1 = ForceUpgrade(
        isUpgradeRequired: true,
        upgradeUrl: 'https://example.com/upgrade1',
      );

      const upgrade2 = ForceUpgrade(
        isUpgradeRequired: true,
        upgradeUrl: 'https://example.com/upgrade1',
      );

      const upgrade3 = ForceUpgrade(
        isUpgradeRequired: true,
        upgradeUrl: 'https://example.com/upgrade2',
      );

      expect(upgrade1, equals(upgrade2));
      expect(upgrade1 == upgrade3, isFalse);
    });

    test('props should include all fields', () {
      const upgrade = ForceUpgrade(
        isUpgradeRequired: true,
        upgradeUrl: 'https://example.com/upgrade',
      );

      expect(upgrade.props, containsAll([true, 'https://example.com/upgrade']));
    });
  });
}
