import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:token_provider/token_provider.dart';

/// {@template api_request_options}
/// Provide optional fields to be passed for [HttpApiClient] requests.
/// {@endtemplate}
class ApiRequestOptions extends Equatable {
  /// {@macro api_request_options}
  const ApiRequestOptions({this.headers});

  /// Json content type header.
  static const json = ApiRequestOptions(
    headers: {'Content-Type': 'application/json'},
  );

  /// Map containing headers to be used on the request (e.g. Authorization).
  final Map<String, String>? headers;

  @override
  List<Object?> get props => [headers];

  /// Merges this with the received [options] returning a new instance
  ApiRequestOptions merge(ApiRequestOptions options) {
    final newHeaders = options.headers != null || headers != null
        ? <String, String>{
            ...headers ?? <String, String>{},
            ...options.headers ?? <String, String>{},
          }
        : null;

    return ApiRequestOptions(headers: newHeaders);
  }
}

/// {@template http_api_client}
/// A client that prepares an http client based on an api key.
/// {@endtemplate}
class HttpApiClient {
  /// {@macro http_api_client}
  HttpApiClient({
    required String apiUrl,
    required String apiKey,
    required TokenProvider tokenProvider,
    Client? httpClient,
  })  : assert(!apiUrl.endsWith(_separator), () {
          throw Exception('Error: api URL must not end with $_separator.');
        }),
        _apiUrl = apiUrl,
        _apiKey = apiKey,
        _tokenProvider = tokenProvider,
        _httpClient = httpClient ?? Client();

  static const _separator = '/';

  /// The base url of the API
  final String _apiUrl;

  /// The API key used to access the http client
  // ignore: unused_field
  final String _apiKey;

  /// The provider of tokens for authenticated requests
  final TokenProvider _tokenProvider;

  final Client _httpClient;

  ApiRequestOptions get _apiKeyHeader {
    return const ApiRequestOptions(
      headers: {
        'Accept': '*/*',
      },
    );
  }

  Uri _buildUri(String path) {
    assert(path.startsWith('/'), () {
      throw Exception('Error: path must start with $_separator.');
    });
    return Uri.parse('$_apiUrl$path');
  }

  Map<String, String>? _mapRequestOptions(ApiRequestOptions? options) {
    if (options != null) {
      return options.merge(_apiKeyHeader).headers;
    }
    return _apiKeyHeader.headers;
  }

  Future<ApiRequestOptions> _applyBearer(ApiRequestOptions? options) async {
    final bearerToken = await _tokenProvider.fetchToken();
    if (bearerToken == null) {
      throw const HttpException(
        'Attempt to make an authenticated request without a proper session',
      );
    }
    return ApiRequestOptions(
      headers: <String, String>{
        'Authorization': 'Bearer $bearerToken',
      },
    ).merge(options ?? const ApiRequestOptions());
  }

  /// Similar to [post], but with applied authorization headers from the
  /// session.
  Future<Response> authenticatedPost(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) async {
    final authenticatedOptions = await _applyBearer(options);
    return post(
      path,
      body: body,
      options: authenticatedOptions,
    );
  }

  /// Makes a post request to the given [path] and returns a future [Response].
  Future<Response> post(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) {
    return _httpClient.post(
      _buildUri(path),
      body: body,
      headers: _mapRequestOptions(options),
    );
  }

  /// Similar to [get], but with applied authorization headers from the session
  Future<Response> authenticatedGet(
    String path, {
    ApiRequestOptions? options,
  }) async {
    final authenticatedOptions = await _applyBearer(options);
    return get(path, options: authenticatedOptions);
  }

  /// Makes a get request to the given [path] and returns a future [Response].
  Future<Response> get(String path, {ApiRequestOptions? options}) {
    return _httpClient.get(
      _buildUri(path),
      headers: _mapRequestOptions(options),
    );
  }

  /// Similar to [delete], but with applied authorization headers
  /// from the session.
  Future<Response> authenticatedDelete(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) async {
    final authenticatedOptions = await _applyBearer(options);
    return delete(path, body: body, options: authenticatedOptions);
  }

  /// Makes a delete request to the given [path] and returns a
  /// future [Response].
  Future<Response> delete(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) {
    return _httpClient.delete(
      _buildUri(path),
      body: body,
      headers: _mapRequestOptions(options),
    );
  }

  /// Similar to [put], but with applied authorization headers from the session.
  Future<Response> authenticatedPut(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) async {
    final authenticatedOptions = await _applyBearer(options);
    return put(
      path,
      body: body,
      options: authenticatedOptions,
    );
  }

  /// Makes a put request to the given [path] and returns
  /// a future [Response]
  Future<Response> put(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) {
    return _httpClient.put(
      _buildUri(path),
      body: body,
      headers: _mapRequestOptions(options),
    );
  }

  /// Similar to [patch], but with applied authorization headers from the
  /// session.
  Future<Response> authenticatedPatch(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) async {
    final authenticatedOptions = await _applyBearer(options);
    return patch(
      path,
      body: body,
      options: authenticatedOptions,
    );
  }

  /// Makes a patch request to the given [path] and returns
  /// a future [Response]
  Future<Response> patch(
    String path, {
    Object? body,
    ApiRequestOptions? options,
  }) {
    return _httpClient.patch(
      _buildUri(path),
      body: body,
      headers: _mapRequestOptions(options),
    );
  }
}
