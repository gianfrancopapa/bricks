// ignore_for_file: prefer_const_constructors
import 'package:api_client/api_client.dart';
import 'package:auth_client/auth_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockAuthenticationClient extends Mock implements AuthenticationClient {}

class MockUserResource extends Mock implements UserResource {}

void main() {
  group('UserRepository', () {
    late ApiClient apiClient;
    late AuthenticationClient authenticationClient;
    late UserResource userResource;
    late UserRepository repository;

    const validEmail = 'example@mail.com';
    const validPassword = 'password';
    const validCode = '12345';
    const validName = 'Name';
    final validUser = AuthenticationUser(id: 'id', email: 'email');

    setUp(() {
      apiClient = MockApiClient();
      authenticationClient = MockAuthenticationClient();
      userResource = MockUserResource();
      repository = UserRepository(
        apiClient: apiClient,
        authenticationClient: authenticationClient,
      );
    });

    test('can be instantiated', () {
      expect(
        UserRepository(
          apiClient: apiClient,
          authenticationClient: authenticationClient,
        ),
        isNotNull,
      );
    });

    test('can be instantiated', () {
      expect(
        UserRepository(
          apiClient: apiClient,
          authenticationClient: authenticationClient,
        ),
        isNotNull,
      );
    });

    group('Authentication status changed', () {
      test('authentication event with session expired state', () async {
        final authenticationEvent =
            AuthenticationEvent(type: AuthEventType.sessionExpired);
        final user = await repository.onAuthStatusChanged(authenticationEvent);

        expect(user, null);
      });

      test('authentication event with signed out state', () async {
        final authenticationEvent =
            AuthenticationEvent(type: AuthEventType.signedOut);
        final user = await repository.onAuthStatusChanged(authenticationEvent);

        expect(user, null);
      });

      test('authentication event with user deleted state', () async {
        final authenticationEvent =
            AuthenticationEvent(type: AuthEventType.userDeleted);
        final user = await repository.onAuthStatusChanged(authenticationEvent);

        expect(user, null);
      });

      test('authentication event with signed in state', () async {
        final authenticationEvent =
            AuthenticationEvent(type: AuthEventType.signedIn, user: validUser);
        final user = await repository.onAuthStatusChanged(authenticationEvent);

        expect(user, isA<User>());
      });

      test('calls auth status change on AuthenticationClient', () {
        when(() => authenticationClient.onAuthStatusChanged).thenAnswer(
          (_) => const Stream.empty(),
        );
        repository.user;
        verify(() => authenticationClient.onAuthStatusChanged).called(1);
      });
    });

    group('Sign up', () {
      test('signs up user success', () {
        when(() => apiClient.userResource).thenReturn(userResource);
        when(
          () => userResource.signUp(
            SignUpRequest(
              email: validEmail,
              password: validPassword,
              name: validName,
            ),
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.signUp(
            email: validEmail,
            password: validPassword,
            name: validName,
          ),
          returnsNormally,
        );
      });

      test('signs up user failure', () {
        when(() => apiClient.userResource.signUp(any())).thenThrow(Exception());

        expect(
          () async => repository.signUp(
            email: validEmail,
            password: validPassword,
            name: validName,
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('signs up user with empty mail', () {
        expect(
          () async => repository.signUp(
            email: '',
            password: validPassword,
            name: validName,
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('signs up user with empty password', () {
        expect(
          () async => repository.signUp(
            email: validEmail,
            password: '',
            name: validName,
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('signs up user with empty name', () async {
        expect(
          () async => repository.signUp(
            email: validEmail,
            password: validPassword,
            name: '',
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Verify email', () {
      test('verify mail success', () async {
        when(() => apiClient.userResource).thenReturn(userResource);
        when(
          () => userResource.verifyEmail(
            EmailVerificationRequest(
              email: validEmail,
              code: validCode,
            ),
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.verifyEmail(
            email: validEmail,
            code: validCode,
          ),
          returnsNormally,
        );
      });

      test('verify mail failure', () async {
        when(() => apiClient.userResource.signUp(any())).thenThrow(Exception());

        expect(
          () async => repository.verifyEmail(
            email: validEmail,
            code: validCode,
          ),
          throwsA(isA<EmailVerificationFailure>()),
        );
      });

      test('verify mail failure', () async {
        when(() => apiClient.userResource.signUp(any())).thenThrow(
          EmailVerificationFailure(Exception(), StackTrace.empty),
        );

        expect(
          () async => repository.verifyEmail(
            email: validEmail,
            code: validCode,
          ),
          throwsA(isA<EmailVerificationFailure>()),
        );
      });

      test('verify mail with empty mail', () async {
        expect(
          () async => repository.verifyEmail(
            email: '',
            code: validCode,
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('verify mail with empty code', () async {
        expect(
          () async => repository.verifyEmail(
            email: validEmail,
            code: '',
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Forgot Password', () {
      test('forgot password success', () async {
        when(() => apiClient.userResource).thenReturn(userResource);
        when(() => userResource.forgotPassword(any())).thenAnswer((_) async {});

        expect(
          () async => repository.forgotPassword(
            email: validEmail,
          ),
          returnsNormally,
        );
      });

      test('forgot password failure', () async {
        when(() => apiClient.userResource.forgotPassword(any()))
            .thenThrow(Exception());

        expect(
          () async => repository.forgotPassword(
            email: validEmail,
          ),
          throwsA(isA<ForgotPasswordFailure>()),
        );
      });

      test('forgot password with empty mail', () async {
        expect(
          () async => repository.forgotPassword(
            email: '',
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Update password', () {
      test('update password success', () async {
        when(() => apiClient.userResource).thenReturn(userResource);
        when(
          () => userResource.updatePassword(
            UpdatePasswordRequest(
              email: validEmail,
              password: validPassword,
              confirmationCode: validCode,
            ),
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.updatePassword(
            email: validEmail,
            password: validPassword,
            code: validCode,
          ),
          returnsNormally,
        );
      });

      test('update password failure', () async {
        when(() => apiClient.userResource.updatePassword(any()))
            .thenThrow(Exception());

        expect(
          () async => repository.updatePassword(
            email: validEmail,
            password: validPassword,
            code: validCode,
          ),
          throwsA(isA<UpdatePasswordFailure>()),
        );
      });

      test('update password with empty email', () async {
        expect(
          () async => repository.updatePassword(
            email: '',
            password: validPassword,
            code: validCode,
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('update password with empty password', () async {
        expect(
          () async => repository.updatePassword(
            email: validEmail,
            password: '',
            code: validCode,
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('update password with empty code', () async {
        expect(
          () async => repository.updatePassword(
            email: validEmail,
            password: validPassword,
            code: '',
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Send OTP code', () {
      test('otp code sent success', () async {
        when(() => apiClient.userResource).thenReturn(userResource);
        when(() => userResource.sendOtpCode(any())).thenAnswer((_) async {});

        expect(
          () async => repository.sendOtpCode(
            email: validEmail,
          ),
          returnsNormally,
        );
      });

      test('otp code sent failure', () async {
        when(() => apiClient.userResource.sendOtpCode(any()))
            .thenThrow(Exception());

        expect(
          () async => repository.sendOtpCode(
            email: validEmail,
          ),
          throwsA(isA<SendOtpCodeFailure>()),
        );
      });

      test('otp code sent failure', () async {
        when(() => apiClient.userResource.sendOtpCode(any())).thenThrow(
          SendOtpCodeFailure(Exception(), StackTrace.empty),
        );

        expect(
          () async => repository.sendOtpCode(
            email: validEmail,
          ),
          throwsA(isA<SendOtpCodeFailure>()),
        );
      });

      test('otp code sent with empty email', () async {
        expect(
          () async => repository.sendOtpCode(
            email: '',
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Sign in', () {
      test('sign in success', () async {
        when(
          () => authenticationClient.signInUser(
            email: validEmail,
            password: validPassword,
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.signIn(
            email: validEmail,
            password: validPassword,
          ),
          returnsNormally,
        );
      });

      test('sign in failure', () async {
        when(
          () => authenticationClient.signInUser(
            email: validEmail,
            password: validPassword,
          ),
        ).thenThrow(Exception());

        expect(
          () async => repository.signIn(
            email: validEmail,
            password: validPassword,
          ),
          throwsA(isA<SignInFailure>()),
        );
      });

      test('sign in with invalid user failure', () async {
        when(
          () => authenticationClient.signInUser(
            email: validEmail,
            password: validPassword,
          ),
        ).thenThrow(
          InvalidUserFailure(Exception(), StackTrace.empty),
        );

        expect(
          () async => repository.signIn(
            email: validEmail,
            password: validPassword,
          ),
          throwsA(isA<InvalidUserFailure>()),
        );
      });

      test('sign in with empty mail', () async {
        expect(
          () async => repository.signIn(
            email: '',
            password: validPassword,
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('verify mail with empty password', () async {
        expect(
          () async => repository.signIn(
            email: validEmail,
            password: '',
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Sign out', () {
      test('sign out user succesfully', () {
        when(() => authenticationClient.signOut()).thenAnswer((_) async {});

        expect(
          () async => repository.signOut(),
          returnsNormally,
        );
      });

      test('sign out user unsuccesfully', () {
        when(() => authenticationClient.signOut()).thenThrow(Exception());

        expect(
          () async => repository.signOut(),
          throwsA(isA<SignOutFailure>()),
        );
      });
    });
  });
}
