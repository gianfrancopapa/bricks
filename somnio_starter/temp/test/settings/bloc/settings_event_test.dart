import 'package:flutter_test/flutter_test.dart';
import 'package:temp/settings/settings.dart';

void main() {
  group('VersionNumberRetrieved', () {
    test('props should be empty', () {
      expect(const VersionNumberRetrieved().props, <Object>[]);
    });
  });

  group('TermsAndConditionsRetrieved', () {
    test('props should be empty', () {
      expect(const TermsAndConditionsRetrieved().props, <Object>[]);
    });
  });

  group('AboutUsRetrieved', () {
    test('props should be empty', () {
      expect(const AboutUsRetrieved().props, <Object>[]);
    });
  });
}
