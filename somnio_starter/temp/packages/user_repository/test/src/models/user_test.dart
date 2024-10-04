import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('User', () {
    const validId = '123';
    const validEmail = 'test@example.com';

    test('constructor initializes properties', () {
      const user = User(id: validId, email: validEmail);

      expect(user.id, equals(validId));
      expect(user.email, equals(validEmail));
    });

    test('props list contains id and email', () {
      const user = User(id: validId, email: validEmail);

      expect(user.props, containsAll([validId, validEmail]));
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
