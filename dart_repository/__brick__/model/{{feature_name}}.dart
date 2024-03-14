import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{feature_name.snakeCase()}}.g.dart';

// Defines the {{feature_name.pascalCase()}} class.
@JsonSerializable()
class {{feature_name.pascalCase()}} extends Equatable{
  final String id;

  // Constructor for {{feature_name.pascalCase()}}.
  const {{feature_name.pascalCase()}}({required this.id,});

  factory {{feature_name.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{feature_name.pascalCase()}}FromJson(json);

  Map<String, dynamic> toJson() => _${{feature_name.pascalCase()}}ToJson(this);

  {{feature_name.pascalCase()}} copyWith({
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
