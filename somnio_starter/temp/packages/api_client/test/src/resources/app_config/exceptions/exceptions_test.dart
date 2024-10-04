import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

class TestAppConfigException extends AppConfigException {
  const TestAppConfigException(super.error, super.stackTrace);
}

void main() {
  group('AppConfigException', () {
    test('can be instantiated', () {
      final error = Exception('test error');
      final stackTrace = StackTrace.current;

      final exception = TestAppConfigException(error, stackTrace);

      expect(exception, isA<AppConfigException>());
      expect(exception.error, error);
      expect(exception.stackTrace, stackTrace);
    });

    test('CheckForceUpgradeFailure can be instantiated', () {
      final error = Exception('force upgrade error');
      final stackTrace = StackTrace.current;

      final exception = CheckForceUpgradeFailure(error, stackTrace);

      expect(exception, isA<CheckForceUpgradeFailure>());
      expect(exception.error, error);
      expect(exception.stackTrace, stackTrace);
    });

    test('CheckDownForMaintenanceFailure can be instantiated', () {
      final error = Exception('down for maintenance error');
      final stackTrace = StackTrace.current;

      final exception = CheckDownForMaintenanceFailure(error, stackTrace);

      expect(exception, isA<CheckDownForMaintenanceFailure>());
      expect(exception.error, error);
      expect(exception.stackTrace, stackTrace);
    });
  });
}
