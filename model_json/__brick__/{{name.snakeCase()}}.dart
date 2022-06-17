import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{name.snakeCase()}}.g.dart';

@JsonSerializable()
class {{name.pascalCase()}} extends Equatable {
  const {{name.pascalCase()}}({
    required this.id,
  });

  factory {{name.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}FromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ToJson(this);

  {{name.pascalCase()}} copyWith({
    String? id,
  }) =>
      User(
        id: id ?? this.id,
      );

  @override
  List<Object?> get props => [
        id,
      ];
}
