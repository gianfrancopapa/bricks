import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

/// {@template user_data}
/// A model representing a temp user.
/// {@endtemplate}
@JsonSerializable()
class UserData extends Equatable {
  /// {@macro user_data}
  const UserData({
    required this.id,
    required this.email,
    required this.name,
  });

  /// {@macro user_data}
  factory UserData.fromJson(Map<String, dynamic> json) {
    return _$UserDataFromJson(json);
  }

  /// The user unique identifer.
  final String id;

  /// The user email address.
  final String email;

  /// The user name.
  final String name;

  @override
  List<Object> get props => [
        id,
        email,
        name,
      ];

  /// Returns a json built from this user.
  Map<String, dynamic> toJson() {
    return _$UserDataToJson(this);
  }
}
