import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';
import 'package:{{project_name}}/authentication/login/login.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';
import 'package:{{project_name}}/l10n/l10n.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState>
    implements SignUpBloc {}

class MockForgotPasswordBloc
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

extension AppTester on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    AppBloc? appBloc,
    SignUpBloc? signUpBloc,
    LoginBloc? loginBloc,
    ForgotPasswordBloc? forgotPasswordBloc,
    TargetPlatform? platform,
    NavigatorObserver? navigatorObserver,
  }) async {
    await pumpWidget(
      MultiBlocProvider(
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
        child: MaterialApp(
          title: 'Authentication Example',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Theme(
            data: ThemeData(platform: platform),
            child: Scaffold(body: widgetUnderTest),
          ),
          navigatorObservers: [
            if (navigatorObserver != null) navigatorObserver,
          ],
        ),
      ),
    );
    await pump();
  }
}
