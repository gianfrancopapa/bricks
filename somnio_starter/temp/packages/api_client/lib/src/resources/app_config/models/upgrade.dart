import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upgrade.g.dart';

/// {@template upgrade}
/// Model used to encapsulate configuration information
/// regarding a upgrade.
/// {@endtemplate}
@JsonSerializable()
class Upgrade extends Equatable {
  /// {@macro force_upgrade}
  const Upgrade({
    required this.androidUpgradeUrl,
    required this.iosUpgradeUrl,
    required this.androidBuildNumber,
    required this.iosBuildNumber,
  });

  /// Deserializes the given [Map<String,dynamic>] into a [Upgrade].
  factory Upgrade.fromJson(Map<String, dynamic> json) =>
      _$UpgradeFromJson(json);

  /// The url where users can upgrade the android application.
  final String androidUpgradeUrl;

  /// The url where users can upgrade the ios application.
  final String iosUpgradeUrl;

  /// The latest android build number.
  final int androidBuildNumber;

  /// The latest ios build number.
  final int iosBuildNumber;

  /// Serializes the [Upgrade] into a [Map<String,dynamic>].
  Map<String, dynamic> toJson() => _$UpgradeToJson(this);

  @override
  List<Object?> get props => [
        androidUpgradeUrl,
        iosUpgradeUrl,
        androidBuildNumber,
        iosBuildNumber,
      ];
}
