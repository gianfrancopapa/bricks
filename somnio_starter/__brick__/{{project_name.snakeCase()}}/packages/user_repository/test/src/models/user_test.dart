import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('User', () {
    const validId = '123';
    const validEmail = 'test@example.com';

    test('constructor initializes properties', () {
      const id = validId;
      const email = validEmail;

      const user = User(id: id, email: email);

      expect(user.id, equals(id));
      expect(user.email, equals(email));
    });

    test('props list contains id and email', () {
      const id = validId;
      const email = validEmail;

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

    test('fromJson and toJson', () {
      final json = <String, dynamic>{
        'id': validId,
        'email': validEmail,
      };

      final user = User.fromJson(json);

      expect(user.id, equals(json['id']));
      expect(user.email, equals(json['email']));

      final toJson = user.toJson();

      expect(toJson['id'], equals(user.id));
      expect(toJson['email'], equals(user.email));
    });
  });
}
