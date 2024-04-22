import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('SignUpRequest', () {
    const email = 'test@example.com';
    const password = 'password';
    const name = 'John Doe';

    test('constructs properly', () {
      const request = SignUpRequest(
        email: email,
        password: password,
        name: name,
      );
      expect(request.email, email);
      expect(request.password, password);
      expect(request.name, name);
    });

    test('fromJson creates a valid instance', () {
      final json = {
        'email': email,
        'password': password,
        'name': name,
      };
      final request = SignUpRequest.fromJson(json);
      expect(request.email, email);
      expect(request.password, password);
      expect(request.name, name);
    });

    test('toJson returns a valid JSON object', () {
      const request = SignUpRequest(
        email: email,
        password: password,
        name: name,
      );
      final json = request.toJson();
      expect(json['email'], email);
      expect(json['password'], password);
      expect(json['name'], name);
    });

    test('props list contains email, password, and name', () {
      const request = SignUpRequest(
        email: email,
        password: password,
        name: name,
      );
      expect(request.props, containsAll([email, password, name]));
    });
  });
}
