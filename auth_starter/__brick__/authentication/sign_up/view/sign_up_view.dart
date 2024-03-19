import 'package:auth_example/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Account registered successfully')),
            );
          if (context.canPop()) {
            context.pop();
          }
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Something went wrong')),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign up')),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            EmailTextField(),
            SizedBox(height: 24),
            PasswordTextField(),
            SizedBox(height: 24),
            ConfirmationPasswordTextField(),
            SizedBox(height: 24),
            SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final valid = context.select((SignUpBloc bloc) => bloc.emailIsValid);

    return TextField(
      onChanged: (value) =>
          context.read<SignUpBloc>().add(SignUpEmailChanged(value)),
      decoration: InputDecoration(
        hintText: 'Email',
        errorText: valid ? null : 'Please enter a valid email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword =
        context.select((SignUpBloc bloc) => bloc.obscurePassowrds);

    final valid = context.select((SignUpBloc bloc) => bloc.passwordIsValid);

    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) =>
          context.read<SignUpBloc>().add(SignUpPasswordChanged(value)),
      decoration: InputDecoration(
        hintText: 'Password',
        errorText: valid ? null : 'Password must be at least 6 characters long',
        suffixIcon: IconButton(
          icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context.read<SignUpBloc>().add(
                  SignUpPasswordVisibilityChanged(obscure: !obscurePassword),
                );
          },
        ),
      ),
      enableIMEPersonalizedLearning: false,
      obscureText: obscurePassword,
    );
  }
}

class ConfirmationPasswordTextField extends StatelessWidget {
  const ConfirmationPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword =
        context.select((SignUpBloc bloc) => bloc.obscurePassowrds);

    final valid = context.select((SignUpBloc bloc) => bloc.passwordsMatch);

    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) => context.read<SignUpBloc>().add(
            SignUpConfirmationPasswordChanged(value),
          ),
      decoration: InputDecoration(
        hintText: 'Password confirmation',
        errorText: valid ? null : 'Passwords do not match',
        suffixIcon: IconButton(
          icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context.read<SignUpBloc>().add(
                  SignUpPasswordVisibilityChanged(obscure: !obscurePassword),
                );
          },
        ),
      ),
      enableIMEPersonalizedLearning: false,
      obscureText: obscurePassword,
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final validToSubmit = context.select((SignUpBloc bloc) => bloc.valid);

    return ElevatedButton(
      onPressed: validToSubmit
          ? () {
              context
                  .read<SignUpBloc>()
                  .add(const SignUpWithEmailAndPasswordRequested());
            }
          : null,
      child: const Text('Sign up'),
    );
  }
}
