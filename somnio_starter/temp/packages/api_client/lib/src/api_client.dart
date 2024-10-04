import 'package:api_client/api_client.dart';

/// {@template api_client}
/// A client to communicate with temp backend
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({
    required HttpApiClient client,
  }) : _client = client;

  final HttpApiClient _client;

  /// {@macro user_resource}
  UserResource get userResource {
    return UserResource(
      client: _client,
    );
  }

  /// {@macro app_config_resource}
  AppConfigResource get appConfigResource {
    return AppConfigResource(
      client: _client,
    );
  }
}
