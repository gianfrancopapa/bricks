import 'package:api_client/api_client.dart';
import 'package:app_config_repository/app_config_repository.dart';
import 'package:auth_client/auth_client.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

Future<App> mainCommon({
  required String apiUrl,
}) async {
  final authClient = AuthenticationClient();
  final client = HttpApiClient(
    apiUrl: apiUrl,
    apiKey: 'apiKey',
    tokenProvider: authClient,
  );
  final apiClient = ApiClient(client: client);
  final userRepository = UserRepository(
    apiClient: apiClient,
    authenticationClient: authClient,
  );

  final user = await userRepository.user.first;

  final appConfigRepository = AppConfigRepository(
    buildNumber: 1,
    platform: Platform.android.isAndroid ? Platform.android : Platform.iOS,
  );

  return App(
    user: user,
    userRepository: userRepository,
    appConfigRepository: appConfigRepository,
  );
}
