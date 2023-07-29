import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '{{feature_name}}_event.dart';
part '{{feature_name}}_state.dart';

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc() : super(const {{feature_name.pascalCase()}}State.initial()){
    on<{{feature_name.pascalCase()}}Event>(_on{{feature_name.pascalCase()}}Event);
  }

  void _on{{feature_name.pascalCase()}}Event(
    {{feature_name.pascalCase()}}Event event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) {}
}
