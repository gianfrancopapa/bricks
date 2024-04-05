import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('UserData', () {
    const id = '123';
    const email = 'test@example.com';
    const name = 'John Doe';

    test('constructs properly', () {
      const userData = UserData(
        id: id,
        email: email,
        name: name,
      );
      expect(userData.id, id);
      expect(userData.email, email);
      expect(userData.name, name);
    });

    test('fromJson creates a valid instance', () {
      final json = {
        'id': id,
        'email': email,
        'name': name,
      };
      final userData = UserData.fromJson(json);
      expect(userData.id, id);
      expect(userData.email, email);
      expect(userData.name, name);
    });

    test('toJson returns a valid JSON object', () {
      const userData = UserData(
        id: id,
        email: email,
        name: name,
      );
      final json = userData.toJson();
      expect(json['id'], id);
      expect(json['email'], email);
      expect(json['name'], name);
    });

    test('props list contains id, email, and name', () {
      const userData = UserData(
        id: id,
        email: email,
        name: name,
      );
      expect(userData.props, containsAll([id, email, name]));
    });
  });
}
