import 'package:auth_client/auth_client.dart';
import 'package:test/test.dart';

void main() {
  group('AuthEventType', () {
    test('isSignedIn returns true for signedIn event', () {
      final isSignedIn = AuthEventType.signedIn.isSignedIn;
      expect(isSignedIn, isTrue);
    });

    test('isSignedOut returns true for signedIn event', () {
      final isSignedOut = AuthEventType.signedOut.isSignedOut;
      expect(isSignedOut, isTrue);
    });

    test('isSessionExpired returns true for signedIn event', () {
      final isSessionExpired = AuthEventType.sessionExpired.isSessionExpired;
      expect(isSessionExpired, isTrue);
    });

    test('isUserDeleted returns true for signedIn event', () {
      final isUserDeleted = AuthEventType.userDeleted.isUserDeleted;
      expect(isUserDeleted, isTrue);
    });
  });

  group('AuthenticationEvent', () {
    test('constructor initializes properties', () {
      const user = AuthenticationUser(id: '123', email: 'test@example.com');
      const type = AuthEventType.signedIn;

      const event = AuthenticationEvent(type: type, user: user);

      expect(event.user, equals(user));
      expect(event.type, equals(type));
    });

    test('constructor initializes user as anonymous if null', () {
      const type = AuthEventType.signedOut;

      const event = AuthenticationEvent(type: type);

      expect(event.user, equals(AuthenticationUser.anonymous));
      expect(event.type, equals(type));
    });

    test('props list contains user and type', () {
      const user = AuthenticationUser(id: '123', email: 'test@example.com');
      const type = AuthEventType.signedIn;

      const event = AuthenticationEvent(type: type, user: user);

      expect(event.props, containsAll([user, type]));
    });

    test('supports value equality', () {
      const eventA = AuthenticationEvent(
        user: AuthenticationUser(id: 'A', email: 'A'),
        type: AuthEventType.signedIn,
      );
      const secondEventA = AuthenticationEvent(
        user: AuthenticationUser(id: 'A', email: 'A'),
        type: AuthEventType.signedIn,
      );
      const eventB = AuthenticationEvent(
        user: AuthenticationUser(id: 'B', email: 'B'),
        type: AuthEventType.signedIn,
      );

      expect(eventA, equals(secondEventA));
      expect(eventA, isNot(equals(eventB)));
    });

    test('constructor initializes user as anonymous if user is null', () {
      const type = AuthEventType.signedOut;
      const event = AuthenticationEvent(type: type);

      expect(event.user, equals(AuthenticationUser.anonymous));
      expect(event.type, equals(type));
    });
  });
}
