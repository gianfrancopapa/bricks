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

    group('Sign up', () {
      const testEmail = 'mail@example.com';
      const testPassword = 'password';
      const testName = 'name';

      test('signs up user success', () {
        when(() => apiClient.userResource).thenReturn(userResource);
        when(
          () => userResource.signUp(
            SignUpRequest(
              email: testEmail,
              password: testPassword,
              name: testName,
            ),
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.signUp(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
          returnsNormally,
        );
      });

      test('signs up user failure', () {
        when(() => apiClient.userResource.signUp(any())).thenThrow(Exception());

        expect(
          () async => repository.signUp(
            email: 'email',
            password: 'password',
            name: 'name',
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('signs up user with empty mail', () {
        expect(
          () async => repository.signUp(
            email: '',
            password: 'password',
            name: 'name',
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('signs up user with empty password', () {
        expect(
          () async => repository.signUp(
            email: 'mail@example.com',
            password: '',
            name: 'name',
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('signs up user with empty name', () async {
        expect(
          () async => repository.signUp(
            email: 'mail@example.com',
            password: 'password',
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
              email: 'mail@example.com',
              code: '123456',
            ),
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.verifyEmail(
            email: 'mail@example.com',
            code: '123456',
          ),
          returnsNormally,
        );
      });

      test('verify mail failure', () async {
        when(() => apiClient.userResource.signUp(any())).thenThrow(Exception());

        expect(
          () async => repository.verifyEmail(
            email: 'mail@example.com',
            code: '123456',
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
            email: 'mail@example.com',
            code: '123456',
          ),
          throwsA(isA<EmailVerificationFailure>()),
        );
      });

      test('verify mail with empty mail', () async {
        expect(
          () async => repository.verifyEmail(
            email: '',
            code: '123456',
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('verify mail with empty code', () async {
        expect(
          () async => repository.verifyEmail(
            email: 'mail@example.com',
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
            email: 'mail@example.com',
          ),
          returnsNormally,
        );
      });

      test('forgot password failure', () async {
        when(() => apiClient.userResource.forgotPassword(any()))
            .thenThrow(Exception());

        expect(
          () async => repository.forgotPassword(
            email: 'mail@example.com',
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
        const testEmail = 'mail@example.com';
        const testPassword = 'password';
        const code = 'code';

        when(() => apiClient.userResource).thenReturn(userResource);
        when(
          () => userResource.updatePassword(
            UpdatePasswordRequest(
              email: testEmail,
              password: testPassword,
              confirmationCode: code,
            ),
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.updatePassword(
            email: 'mail@example.com',
            password: 'password',
            code: 'code',
          ),
          returnsNormally,
        );
      });

      test('update password failure', () async {
        when(() => apiClient.userResource.updatePassword(any()))
            .thenThrow(Exception());

        expect(
          () async => repository.updatePassword(
            email: 'mail@example.com',
            password: 'password',
            code: 'code',
          ),
          throwsA(isA<UpdatePasswordFailure>()),
        );
      });

      test('update password with empty email', () async {
        expect(
          () async => repository.updatePassword(
            email: '',
            password: 'password',
            code: 'code',
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('update password with empty password', () async {
        expect(
          () async => repository.updatePassword(
            email: 'mail@example.com',
            password: '',
            code: 'code',
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('update password with empty code', () async {
        expect(
          () async => repository.updatePassword(
            email: 'mail@example.com',
            password: 'password',
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
            email: 'mail@example.com',
          ),
          returnsNormally,
        );
      });

      test('otp code sent failure', () async {
        when(() => apiClient.userResource.sendOtpCode(any()))
            .thenThrow(Exception());

        expect(
          () async => repository.sendOtpCode(
            email: 'mail@example.com',
          ),
          throwsA(isA<SendOtpCodeFailure>()),
        );
      });

      test('otp code sent failure', () async {
        when(() => apiClient.userResource.sendOtpCode(any())).thenThrow(
          EmailVerificationFailure(Exception(), StackTrace.empty),
        );

        expect(
          () async => repository.sendOtpCode(
            email: 'mail@example.com',
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
        const testEmail = 'mail@example.com';
        const testPassword = 'password';

        when(
          () => authenticationClient.signInUser(
            email: testEmail,
            password: testPassword,
          ),
        ).thenAnswer((_) async {});

        expect(
          () async => repository.signIn(
            email: testEmail,
            password: testPassword,
          ),
          returnsNormally,
        );
      });

      test('sign in failure', () async {
        const testEmail = 'mail@example.com';
        const testPassword = 'password';
        when(
          () => authenticationClient.signInUser(
            email: testEmail,
            password: testPassword,
          ),
        ).thenThrow(Exception());

        expect(
          () async => repository.signIn(
            email: testEmail,
            password: testPassword,
          ),
          throwsA(isA<SignInFailure>()),
        );
      });

      test('sign in failure', () async {
        const testEmail = 'mail@example.com';
        const testPassword = 'password';
        when(
          () => authenticationClient.signInUser(
            email: testEmail,
            password: testPassword,
          ),
        ).thenThrow(
          EmailVerificationFailure(Exception(), StackTrace.empty),
        );

        expect(
          () async => repository.signIn(
            email: testEmail,
            password: testPassword,
          ),
          throwsA(isA<SignInFailure>()),
        );
      });

      test('sign in with empty mail', () async {
        expect(
          () async => repository.signIn(
            email: '',
            password: 'password',
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('verify mail with empty password', () async {
        expect(
          () async => repository.signIn(
            email: 'mail@example.com',
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
