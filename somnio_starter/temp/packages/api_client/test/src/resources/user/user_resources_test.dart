import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpApiClient extends Mock implements HttpApiClient {}

class MockUserResource extends Mock implements UserResource {}

void main() {
  group('UserResource', () {
    late HttpApiClient client;
    late UserResource subject;

    setUp(() {
      client = MockHttpApiClient();
      subject = UserResource(client: client);
    });

    test('signs up user correctly', () async {
      when(
        () => client.post(
          UserResource.kSignUp,
          body: {
            'email': 'test@example.com',
            'password': 'password',
            'name': 'Test User',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 201)));

      await subject.signUp(
        const SignUpRequest(
          email: 'test@example.com',
          password: 'password',
          name: 'Test User',
        ),
      );

      verify(
        () => client.post(
          UserResource.kSignUp,
          body: {
            'email': 'test@example.com',
            'password': 'password',
            'name': 'Test User',
          },
        ),
      ).called(1);
    });

    test('throws EmailAlreadyExistFailure on duplicate email during sign-up',
        () async {
      when(
        () => client.post(
          UserResource.kSignUp,
          body: {
            'email': 'test@example.com',
            'password': 'password',
            'name': 'Test User',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 409)));

      expect(
        () => subject.signUp(
          const SignUpRequest(
            email: 'test@example.com',
            password: 'password',
            name: 'Test User',
          ),
        ),
        throwsA(isA<EmailAlreadyExistFailure>()),
      );

      verify(
        () => client.post(
          UserResource.kSignUp,
          body: {
            'email': 'test@example.com',
            'password': 'password',
            'name': 'Test User',
          },
        ),
      ).called(1);
    });

    test('throws error on status != 201 and != 409 during sign-up', () async {
      when(
        () => client.post(
          UserResource.kSignUp,
          body: {
            'email': 'test@example.com',
            'password': 'password',
            'name': 'Test User',
          },
        ),
      ).thenAnswer(
        (_) async => Future.value(
          Response('{"message": "This is a test message"}', 500),
        ),
      );

      expect(
        () => subject.signUp(
          const SignUpRequest(
            email: 'test@example.com',
            password: 'password',
            name: 'Test User',
          ),
        ),
        throwsA(isA<SignUpFailure>()),
      );

      verify(
        () => client.post(
          UserResource.kSignUp,
          body: {
            'email': 'test@example.com',
            'password': 'password',
            'name': 'Test User',
          },
        ),
      ).called(1);
    });

    test('Verifies email successfully', () async {
      when(
        () => client.post(
          UserResource.kVerifyEmail,
          body: {
            'email': 'email',
            'code': 'code',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 201)));

      await subject.verifyEmail(
        const EmailVerificationRequest(
          email: 'email',
          code: 'code',
        ),
      );

      verify(
        () => client.post(
          UserResource.kVerifyEmail,
          body: {
            'email': 'email',
            'code': 'code',
          },
        ),
      ).called(1);
    });

    test('Verifies email failure with response code != 201', () async {
      when(
        () => client.post(
          UserResource.kVerifyEmail,
          body: {
            'email': 'email',
            'code': 'code',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 200)));

      expect(
        () => subject.verifyEmail(
          const EmailVerificationRequest(
            email: 'email',
            code: 'code',
          ),
        ),
        throwsA(isA<EmailVerificationFailure>()),
      );
    });

    test('Verifies email failure', () async {
      when(
        () => client.post(
          UserResource.kVerifyEmail,
          body: {
            'email': 'email',
            'code': 'code',
          },
        ),
      ).thenThrow(Exception());

      expect(
        () => subject.verifyEmail(
          const EmailVerificationRequest(
            email: 'email',
            code: 'code',
          ),
        ),
        throwsA(isA<EmailVerificationFailure>()),
      );
    });

    test('Recovers password successfully', () async {
      when(
        () => client.post(
          UserResource.kPasswordRecovery,
          body: {
            'email': 'email',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 201)));

      await subject.forgotPassword(
        'email',
      );

      verify(
        () => client.post(
          UserResource.kPasswordRecovery,
          body: {
            'email': 'email',
          },
        ),
      ).called(1);
    });

    test('Recovers password failure with response code != 201', () async {
      when(
        () => client.post(
          UserResource.kPasswordRecovery,
          body: {
            'email': 'email',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 200)));

      expect(
        () => subject.forgotPassword(
          'email',
        ),
        throwsA(isA<ForgotPasswordFailure>()),
      );
    });

    test('Recovers password with error', () async {
      when(
        () => client.post(
          UserResource.kPasswordRecovery,
          body: {
            'email': 'email',
          },
        ),
      ).thenThrow(Exception());

      expect(
        () => subject.forgotPassword(
          'email',
        ),
        throwsA(isA<ForgotPasswordFailure>()),
      );
    });

    test('Updates password successfully', () async {
      when(
        () => client.post(
          UserResource.kPasswordConfirmation,
          body: {
            'email': 'email',
            'password': 'password',
            'confirmationCode': 'confirmationCode',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 201)));

      await subject.updatePassword(
        const UpdatePasswordRequest(
          email: 'email',
          password: 'password',
          confirmationCode: 'confirmationCode',
        ),
      );

      verify(
        () => client.post(
          UserResource.kPasswordConfirmation,
          body: {
            'email': 'email',
            'password': 'password',
            'confirmationCode': 'confirmationCode',
          },
        ),
      ).called(1);
    });

    test('Updates password failure with response code != 201', () async {
      when(
        () => client.post(
          UserResource.kPasswordConfirmation,
          body: {
            'email': 'email',
            'password': 'password',
            'confirmationCode': 'confirmationCode',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 200)));

      expect(
        () => subject.updatePassword(
          const UpdatePasswordRequest(
            email: 'email',
            password: 'password',
            confirmationCode: 'confirmationCode',
          ),
        ),
        throwsA(isA<UpdatePasswordFailure>()),
      );
    });

    test('Updates password with error', () async {
      when(
        () => client.post(
          UserResource.kPasswordConfirmation,
          body: {
            'email': 'email',
            'password': 'password',
            'confirmation_code': 'confirmationCode',
          },
        ),
      ).thenThrow(Exception());

      expect(
        () => subject.updatePassword(
          const UpdatePasswordRequest(
            email: 'email',
            password: 'password',
            confirmationCode: 'confirmationCode',
          ),
        ),
        throwsA(isA<UpdatePasswordFailure>()),
      );
    });

    test('Sends OTP successfully', () async {
      when(
        () => client.post(
          UserResource.kCodeVerification,
          body: {
            'email': 'email',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 201)));

      await subject.sendOtpCode(
        'email',
      );

      verify(
        () => client.post(
          UserResource.kCodeVerification,
          body: {
            'email': 'email',
          },
        ),
      ).called(1);
    });

    test('Sends OTP failure with response code != 201', () async {
      when(
        () => client.post(
          UserResource.kCodeVerification,
          body: {
            'email': 'email',
          },
        ),
      ).thenAnswer((_) async => Future.value(Response('', 200)));

      expect(
        () => subject.sendOtpCode(
          'email',
        ),
        throwsA(isA<SendOtpCodeFailure>()),
      );
    });

    test('Sends OTP with error', () async {
      when(
        () => client.post(
          UserResource.kCodeVerification,
          body: {
            'email': 'email',
          },
        ),
      ).thenThrow(Exception());

      expect(
        () => subject.sendOtpCode(
          'email',
        ),
        throwsA(isA<SendOtpCodeFailure>()),
      );
    });

    test('Gets authenticated user successfully', () async {
      when(
        () => client.authenticatedGet(UserResource.kUser),
      ).thenAnswer(
        (_) async => Future.value(
          Response(
            json.encode({
              'id': 'id',
              'email': 'email',
              'name': 'name',
            }),
            200,
          ),
        ),
      );

      await subject.getAuthenticatedUser();

      verify(
        () => client.authenticatedGet(UserResource.kUser),
      ).called(1);
    });

    test('Gets authenticated user failure with response code != 200', () async {
      when(
        () => client.authenticatedGet(UserResource.kUser),
      ).thenAnswer(
        (_) async => Future.value(
          Response(
            json.encode({
              'id': 'id',
              'email': 'email',
              'name': 'name',
            }),
            400,
          ),
        ),
      );

      expect(
        () => subject.getAuthenticatedUser(),
        throwsA(isA<GetAuthenticatedUserFailure>()),
      );
    });

    test('Gets authenticated user with error', () async {
      when(
        () => client.post(UserResource.kUser),
      ).thenThrow(Exception());

      expect(
        () => subject.getAuthenticatedUser(),
        throwsA(isA<GetAuthenticatedUserFailure>()),
      );
    });
  });
}
