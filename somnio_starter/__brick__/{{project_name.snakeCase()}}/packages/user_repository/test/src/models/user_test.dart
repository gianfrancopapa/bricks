import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('User', () {
    test('constructor initializes properties', () {
      const id = '123';
      const email = 'test@example.com';

      const user = User(id: id, email: email);

      expect(user.id, equals(id));
      expect(user.email, equals(email));
    });

    test('props list contains id and email', () {
      const id = '123';
      const email = 'test@example.com';

      const user = User(id: id, email: email);

      expect(user.props, containsAll([id, email]));
    });

    test('supports value equality', () {
      const userA = User(id: 'A', email: 'A');
      const secondUserA = User(id: 'A', email: 'A');
      const userB = User(id: 'B', email: 'B');

      expect(userA, equals(secondUserA));
      expect(userA, isNot(equals(userB)));
    });
  });
}
