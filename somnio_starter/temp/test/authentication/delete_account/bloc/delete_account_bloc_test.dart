import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temp/authentication/delete_account/delete_account.dart';
import 'package:user_repository/user_repository.dart';

import '../../../helpers/helpers.dart';

void main() {
  late UserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });
  group('DeleteAccountBloc', () {
    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emit [] when nothing is added',
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      expect: () => <DeleteAccountState>[],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [email] when ',
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountEmailChanged('email')),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(email: const Email.dirty('email')),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [password] when DeleteAccountPasswordChanged is added',
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountPasswordChanged('password')),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(password: const Password.dirty('password')),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.loading] '
      'and [DeleteAccountStatus.reauthFailure] '
      'when DeleteAccountRequested is added',
      setUp: () {
        when(
          () => mockUserRepository.deleteAccount(),
        ).thenThrow(UserReAuthenticateFailure(Error(), StackTrace.empty));
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountRequested()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.loading),
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.reauthFailure),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.failure] '
      'when DeleteAccountRequested is added and throws an exception',
      setUp: () {
        when(
          () => mockUserRepository.deleteAccount(),
        ).thenThrow(Exception());
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountRequested()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.loading),
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.failure),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.loading] '
      'and [DeleteAccountStatus.success] '
      'when DeleteAccountSubmitted is added',
      setUp: () {
        when(
          () => mockUserRepository.deleteAccount(),
        ).thenAnswer((_) async {});
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountSubmitted()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.loading),
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.success),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.deleteAccountFailure] '
      'when DeleteAccountSubmitted is added and throws an exception',
      setUp: () {
        when(
          () => mockUserRepository.deleteAccount(),
        ).thenThrow(UserDeleteAccountFailure(Error(), StackTrace.empty));
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountSubmitted()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.loading),
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.deleteAccountFailure),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.failure] '
      'when DeleteAccountSubmitted is added and throws an exception',
      setUp: () {
        when(
          () => mockUserRepository.deleteAccount(),
        ).thenThrow(Exception());
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountSubmitted()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.loading),
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.failure),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.reauthenticated] '
      'when deleteAccount is succesful and DeleteAccountRequested is added',
      setUp: () {
        when(
          () => mockUserRepository.deleteAccount(),
        ).thenAnswer((_) async {});
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountRequested()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.loading),
        const DeleteAccountState.initial()
            .copyWith(status: DeleteAccountStatus.reauthenticated),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.initial] '
      'when DeleteAccountResetted is added',
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountResetted()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState.initial(),
      ],
    );
  });
}
