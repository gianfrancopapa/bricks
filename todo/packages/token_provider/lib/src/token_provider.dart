/// {@template token_provider}
/// Provides an abstraction for access token retrieval.
/// {@endtemplate}
abstract class TokenProvider {
  /// {@macro token_provider}
  const TokenProvider();

  /// Fetches the current access token available in the session
  /// returns null when no session is active at the moment
  Future<String?> fetchToken();

  /// Send a request to the provider to refresh the token
  Future<void> requestTokenRefresh();
}
