import 'package:equatable/equatable.dart';

/// Platform which is used to determine whether an upgrade is required.
enum Platform {
  /// Google's OS for mobile and tablet.
  android,

  /// Apple's OS for iPhone and iPad.
  iOS,
}

/// Extension on [Platform] which exposes getters
/// to interpret the current [Platform].
extension PlatformX on Platform {
  /// Whether the current platform is [Platform.android].
  bool get isAndroid => this == Platform.android;

  /// Whether the current platform is [Platform.iOS].
  bool get isIos => this == Platform.iOS;
}

/// {@template force_upgrade}
/// Model used to encapsulate configuration information
/// regarding force upgrade.
///
/// Includes a `bool` [isUpgradeRequired] which determines if
/// the current application requires a force upgrade as well as
/// an [upgradeUrl] to link to the latest version of the application.
/// {@endtemplate}
class ForceUpgrade extends Equatable {
  /// {@macro force_upgrade}
  const ForceUpgrade({
    required this.isUpgradeRequired,
    this.upgradeUrl,
  });

  /// Whether an upgrade is required.
  final bool isUpgradeRequired;

  /// The url where users can upgrade the application.
  final String? upgradeUrl;

  @override
  List<Object?> get props => [isUpgradeRequired, upgradeUrl];
}
