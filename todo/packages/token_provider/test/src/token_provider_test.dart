import 'package:test/test.dart';
import 'package:token_provider/token_provider.dart';

class DummyTokenProvider extends TokenProvider {
  @override
  Future<String?> fetchToken() {
    throw UnimplementedError();
  }

  @override
  Future<void> requestTokenRefresh() {
    throw UnimplementedError();
  }
}

void main() {
  group('TokenProvider', () {
    test('can be instantiated', () {
      expect(DummyTokenProvider(), isNotNull);
    });
  });
}
