import 'package:facebook/authentication/delete_account/delete_account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

void main() {
  late DeleteAccountBloc mockDeleteAccountBloc;

  setUp(() {
    mockDeleteAccountBloc = MockDeleteAccountBloc();
    when(() => mockDeleteAccountBloc.state)
        .thenReturn(const DeleteAccountState.initial());
  });
  group('DeleteAccountView', () {
    testWidgets('Renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const DeleteAccountView(),
        deleteAccountBloc: mockDeleteAccountBloc,
      );

      expect(find.byType(DeleteAccountForm), findsOneWidget);
    });
  });
}
