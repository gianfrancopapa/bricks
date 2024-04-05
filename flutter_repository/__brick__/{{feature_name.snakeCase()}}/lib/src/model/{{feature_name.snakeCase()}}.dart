import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{feature_name.snakeCase()}}.g.dart';

/// {@template {{feature_name.snakeCase()}}}
/// {{feature_name.pascalCase()}} flutter package.
/// {@endtemplate}
///
/// Defines the {{feature_name.pascalCase()}} class.
@JsonSerializable()
class {{feature_name.pascalCase()}} extends Equatable {
  final String id;

  // Constructor for {{feature_name.pascalCase()}}.
  const {{feature_name.pascalCase()}}({required this.id});

  // FromJson factory constructor.
  factory {{feature_name.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{feature_name.pascalCase()}}FromJson(json);

  // ToJson method.
  Map<String, dynamic> toJson() => _${{feature_name.pascalCase()}}ToJson(this);

  // copyWith method for creating a new instance with some different values.
  {{feature_name.pascalCase()}} copyWith({
    String? id,
  }) => {{feature_name.pascalCase()}}(
        id: id ?? this.id,
      );

  @override
  List<Object?> get props => [id];
}
