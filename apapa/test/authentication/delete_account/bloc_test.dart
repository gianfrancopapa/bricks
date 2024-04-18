import 'package:apapa/authentication/delete_account/delete_account.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  late UserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });
  group('Delete Account bloc', () {
    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'Emit [] when nothing is added',
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      expect: () => <DeleteAccountState>[],
    );
    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [email] when ',
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountEmailChanged('email')),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState().copyWith(email: const Email.dirty('email')),
      ],
    );
    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [password] when ',
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountPasswordChanged('password')),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState()
            .copyWith(password: const Password.dirty('password')),
      ],
    );
    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.loading] '
      'and [DeleteAccountStatus.reauthenticated] '
      'when DeleteAccountRequested is added',
      setUp: () {
        when(
          () => mockUserRepository.reAuthenticate(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountRequested()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState(status: DeleteAccountStatus.loading),
        const DeleteAccountState(status: DeleteAccountStatus.reauthenticated),
      ],
    );
    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.loading] '
      'and [DeleteAccountStatus.reauthFailure] '
      'when DeleteAccountRequested is added',
      setUp: () {
        when(
          () => mockUserRepository.reAuthenticate(
            email: any(named: ''),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountRequested()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState(status: DeleteAccountStatus.loading),
        const DeleteAccountState(status: DeleteAccountStatus.failure),
      ],
    );
    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [DeleteAccountStatus.loading] '
      'and [DeleteAccountStatus.reauthFailure] '
      'when DeleteAccountRequested is added',
      setUp: () {
        when(
          () => mockUserRepository.reAuthenticate(
            email: any(named: 'email'),
            password: any(named: ''),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => DeleteAccountBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const DeleteAccountRequested()),
      expect: () => <DeleteAccountState>[
        const DeleteAccountState(status: DeleteAccountStatus.loading),
        const DeleteAccountState(status: DeleteAccountStatus.failure),
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
        const DeleteAccountState(status: DeleteAccountStatus.loading),
        const DeleteAccountState(status: DeleteAccountStatus.success),
      ],
    );
  });
}
