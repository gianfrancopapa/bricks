import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('EmailVerificationRequest', () {
    const email = 'test@example.com';
    const code = '123456';

    test('constructs properly', () {
      const request = EmailVerificationRequest(email: email, code: code);
      expect(request.email, email);
      expect(request.code, code);
    });

    test('fromJson creates a valid instance', () {
      final json = {
        'email': email,
        'code': code,
      };
      final request = EmailVerificationRequest.fromJson(json);
      expect(request.email, email);
      expect(request.code, code);
    });

    test('toJson returns a valid JSON object', () {
      const request = EmailVerificationRequest(email: email, code: code);
      final json = request.toJson();
      expect(json['email'], email);
      expect(json['code'], code);
    });

    test('props list contains email and code', () {
      const request = EmailVerificationRequest(email: email, code: code);
      expect(request.props, containsAll([email, code]));
    });
  });
}
