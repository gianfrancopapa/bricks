import 'package:apapa/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

extension BuildContextX on BuildContext {
  User? get user => read<AppBloc>().state.user;
}
