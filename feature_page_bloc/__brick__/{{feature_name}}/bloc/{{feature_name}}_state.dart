part of '{{feature_name}}_bloc.dart';

enum {{feature_name.pascalCase()}}Status {
  initial,
  loading,
  loaded,
  error,
}

class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State({
    required this.status,
  });

  const {{feature_name.pascalCase()}}State.initial()
      : this(        
          status: {{feature_name.pascalCase()}}Status.initial,
        );

  final {{feature_name.pascalCase()}}Status status;

  {{feature_name.pascalCase()}}State copyWith({
    {{feature_name.pascalCase()}}Status? status,
  }) {
    return {{feature_name.pascalCase()}}State(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
