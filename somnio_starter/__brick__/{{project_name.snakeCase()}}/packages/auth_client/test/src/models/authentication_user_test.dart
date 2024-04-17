import 'package:auth_client/auth_client.dart';
import 'package:test/test.dart';

void main() {
  group('AuthenticationUser', () {
    test('constructor initializes properties', () {
      const id = '123';
      const email = 'test@example.com';

      const user = AuthenticationUser(id: id, email: email);

      expect(user.id, equals(id));
      expect(user.email, equals(email));
    });

    test('anonymous user is initialized correctly', () {
      const user = AuthenticationUser.anonymous;

      expect(user.id, isEmpty);
      expect(user.email, isEmpty);
    });

    test('props list contains id and email', () {
      const id = '123';
      const email = 'test@example.com';

      const user = AuthenticationUser(id: id, email: email);

      expect(user.props, containsAll([id, email]));
    });

    test('supports value equality', () {
      const userA = AuthenticationUser(id: 'A', email: 'A');
      const secondUserA = AuthenticationUser(id: 'A', email: 'A');
      const userB = AuthenticationUser(id: 'B', email: 'B');

      expect(userA, equals(secondUserA));
      expect(userA, isNot(equals(userB)));
    });

    test('isAnonymous returns true for anonymous user', () {
      expect(AuthenticationUser.anonymous.isAnonymous, isTrue);
    });

    test(
        'constructor initializes properties with '
        'empty strings if values are empty', () {
      const user = AuthenticationUser.anonymous;

      expect(user.id, isEmpty);
      expect(user.email, isEmpty);
    });
  });
}
