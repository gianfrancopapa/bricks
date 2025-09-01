import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('UpdatePasswordRequest', () {
    const email = 'test@example.com';
    const password = 'newPassword';
    const confirmationCode = '123456';

    test('constructs properly', () {
      const request = UpdatePasswordRequest(
        email: email,
        password: password,
        confirmationCode: confirmationCode,
      );
      expect(request.email, email);
      expect(request.password, password);
      expect(request.confirmationCode, confirmationCode);
    });

    test('fromJson creates a valid instance', () {
      final json = {
        'email': email,
        'password': password,
        'confirmationCode': confirmationCode,
      };
      final request = UpdatePasswordRequest.fromJson(json);
      expect(request.email, email);
      expect(request.password, password);
      expect(request.confirmationCode, confirmationCode);
    });

    test('toJson returns a valid JSON object', () {
      const request = UpdatePasswordRequest(
        email: email,
        password: password,
        confirmationCode: confirmationCode,
      );
      final json = request.toJson();
      expect(json['email'], email);
      expect(json['password'], password);
      expect(json['confirmationCode'], confirmationCode);
    });

    test('props list contains email, password, and confirmationCode', () {
      const request = UpdatePasswordRequest(
        email: email,
        password: password,
        confirmationCode: confirmationCode,
      );
      expect(request.props, containsAll([email, password, confirmationCode]));
    });
  });
}
