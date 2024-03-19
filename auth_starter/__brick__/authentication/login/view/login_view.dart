import 'package:auth_example/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Log in successful')),
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
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            EmailTextField(),
            SizedBox(height: 24),
            PasswordTextField(),
            SizedBox(height: 24),
            LoginButton(),
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
    final valid = context.select((LoginBloc bloc) {
      final email = bloc.state.email;
      return email.isValid || email.isPure;
    });

    return TextField(
      onChanged: (value) =>
          context.read<LoginBloc>().add(LoginEmailChanged(value)),
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
        context.select((LoginBloc bloc) => bloc.obscurePassowrd);

    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(value)),
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context
                .read<LoginBloc>()
                .add(LoginPasswordVisibilityChanged(obscure: !obscurePassword));
          },
        ),
      ),
      enableIMEPersonalizedLearning: false,
      obscureText: obscurePassword,
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final validToSubmit = context.select((LoginBloc bloc) => bloc.valid);

    return ElevatedButton(
      onPressed: validToSubmit
          ? () {
              context
                  .read<LoginBloc>()
                  .add(const LoginWithEmailAndPasswordRequested());
            }
          : null,
      child: const Text('Log in'),
    );
  }
}
