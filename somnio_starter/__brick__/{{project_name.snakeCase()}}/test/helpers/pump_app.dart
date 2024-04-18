import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';
import 'package:{{project_name}}/authentication/login/login.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';
import 'package:{{project_name}}/l10n/l10n.dart';
import 'package:user_repository/user_repository.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState>
    implements SignUpBloc {}

class MockForgotPasswordBloc
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthListenable extends Mock implements AuthListenable {}

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<MaterialApp> {}

extension AppTester on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    AppBloc? appBloc,
    SignUpBloc? signUpBloc,
    LoginBloc? loginBloc,
    ForgotPasswordBloc? forgotPasswordBloc,
    TargetPlatform? platform,
    NavigatorObserver? navigatorObserver,
    UserRepository? userRepository,
  }) async {
    final router = GoRouter(
      observers: navigatorObserver == null ? [] : [navigatorObserver],
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: Builder(
              builder: (context) {
                return widgetUnderTest;
              },
            ),
          ),
        ),
        GoRoute(
          path: '/signUpTestPath',
          builder: (context, state) => Scaffold(
            body: Builder(
              builder: (context) {
                return const SignUpView();
              },
            ),
          ),
        ),
      ],
    );
    await pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: userRepository ?? MockUserRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: signUpBloc ?? MockSignUpBloc(),
            ),
            BlocProvider.value(
              value: appBloc ?? MockAppBloc(),
            ),
            BlocProvider.value(
              value: loginBloc ?? MockLoginBloc(),
            ),
            BlocProvider.value(
              value: forgotPasswordBloc ?? MockForgotPasswordBloc(),
            ),
          ],
          child: MaterialApp.router(
            title: 'Somnio Starter',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: router,
          ),
        ),
      ),
    );
    await pump();
  }
}
