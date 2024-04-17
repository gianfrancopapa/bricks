import 'package:flutter/material.dart';

abstract class Keys {
  static const Key signUpNameTextField = Key('signUpNameTextField');
  static const Key signUpEmailTextField = Key('signUpEmailTextField');
  static const Key signUpPasswordTextField = Key('signUpPasswordTextField');
  static const Key signUpConfirmationPasswordTextField =
      Key('signUpConfirmationPasswordTextField');
  static const Key loginSignUpButton = Key('loginSignUpButton');
  static const Key loginForgotPasswordButton = Key('loginForgotPasswordButton');
  static const Key loginEmailTextField = Key('loginEmailTextField');
  static const Key loginPasswordTextField = Key('loginPasswordTextField');
  static const Key loginSignInButton = Key('loginSignInButton');
}
