import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_repository.g.dart';

/// {@template users_repository}
/// UsersRepository flutter package.
/// {@endtemplate}
///
/// Defines the UsersRepository class.
@JsonSerializable()
class UsersRepository extends Equatable {
  // Constructor for UsersRepository.
  const UsersRepository({required this.id});

  // FromJson factory constructor.
  factory UsersRepository.fromJson(Map<String, dynamic> json) =>
      _$UsersRepositoryFromJson(json);
  final String id;

  // ToJson method.
  Map<String, dynamic> toJson() => _$UsersRepositoryToJson(this);

  // copyWith method for creating a new instance with some different values.
  UsersRepository copyWith({
    String? id,
  }) =>
      UsersRepository(
        id: id ?? this.id,
      );

  @override
  List<Object?> get props => [id];
}
