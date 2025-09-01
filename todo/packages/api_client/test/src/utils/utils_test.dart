import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('Utils', () {
    test('tryToListStringToString returns null for null input', () {
      expect(Utils.tryToListStringToString(null), isNull);
    });

    test('tryToListStringToString returns string separated by commas', () {
      final input = ['a', 'b', 'c'];
      const expected = 'a,b,c';
      expect(Utils.tryToListStringToString(input), equals(expected));
    });

    test('tryToListStringToString returns empty string for empty list', () {
      final input = <String>[];
      const expected = '';
      expect(Utils.tryToListStringToString(input), equals(expected));
    });
  });
}
