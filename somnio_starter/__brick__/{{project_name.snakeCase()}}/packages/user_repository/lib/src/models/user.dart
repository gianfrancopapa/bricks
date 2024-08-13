import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// {@template user}
/// A model representing a {{project_name}} user.
/// {@endtemplate}
@JsonSerializable()
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.email,
  });

  /// {@macro user}
  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  /// The user unique identifer.
  final String id;

  /// The user email address.
  final String email;

  @override
  List<Object> get props => [
        id,
        email,
      ];

  /// Returns a json built from this user.
  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
