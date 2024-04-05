import 'package:auth_client/auth_client.dart';
import 'package:test/test.dart';

void main() {
  group('AuthClient', () {

    test('can be instantiated', () {
      final repository = AuthenticationClient();
      expect(repository, isNotNull);
      expect(repository, isA<AuthenticationClient>());
    });
  });
}
