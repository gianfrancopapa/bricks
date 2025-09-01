import 'package:api_client/api_client.dart';
import 'package:http/http.dart';

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:token_provider/token_provider.dart';

class MockClient extends Mock implements Client {}

class MockTokenProvider extends Mock implements TokenProvider {}

void main() {
  group('HttpApiClient', () {
    const path = '/some-api';
    const apiUrl = 'https://api.com';
    const apiKey = 'myApiKey';
    const apiKeyHeaders = {
      'Accept': '*/*',
    };

    late Client client;
    late TokenProvider tokenProvider;
    late HttpApiClient subject;

    Uri buildUri(String path) {
      return Uri.parse('$apiUrl$path');
    }

    setUp(() {
      tokenProvider = MockTokenProvider();
      client = MockClient();

      subject = HttpApiClient(
        apiUrl: apiUrl,
        apiKey: apiKey,
        httpClient: client,
        tokenProvider: tokenProvider,
      );
    });

    test('can be instantiated', () {
      expect(
        HttpApiClient(
          apiUrl: apiUrl,
          apiKey: apiKey,
          tokenProvider: tokenProvider,
        ),
        isNotNull,
      );
    });

    test('throw AssertionError when apiUrl ends with /', () {
      expect(
        () => HttpApiClient(
          apiUrl: '$apiUrl/',
          apiKey: apiKey,
          tokenProvider: tokenProvider,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('throw AssertionError when path does not start with /', () {
      when(() => tokenProvider.fetchToken()).thenAnswer(
        (_) async => 'Bearer token',
      );

      expectLater(
        () async => subject.get('path'),
        throwsA(isA<AssertionError>()),
      );

      expectLater(
        () async => subject.authenticatedGet('path'),
        throwsA(isA<AssertionError>()),
      );

      expectLater(
        () async => subject.delete('path'),
        throwsA(isA<AssertionError>()),
      );

      expectLater(
        () async => subject.authenticatedDelete('path'),
        throwsA(isA<AssertionError>()),
      );

      expectLater(
        () async => subject.post('path'),
        throwsA(isA<AssertionError>()),
      );

      expectLater(
        () async => subject.authenticatedPost('path'),
        throwsA(isA<AssertionError>()),
      );

      expectLater(
        () async => subject.put('path'),
        throwsA(isA<AssertionError>()),
      );

      expectLater(
        () async => subject.authenticatedPut('path'),
        throwsA(isA<AssertionError>()),
      );
    });

    group('applies the api key and base url to requests', () {
      final uri = buildUri(path);
      final body = {'message': 'data'};

      test('on a get request', () async {
        when(() => client.get(uri, headers: apiKeyHeaders)).thenAnswer(
          (_) async => Response('body', 200),
        );

        final response = await subject.get(path);

        verify(
          () => client.get(uri, headers: apiKeyHeaders),
        ).called(1);
        expect(response.statusCode, 200);
        expect(response.body, 'body');
      });

      test('on a delete request', () async {
        when(() => client.delete(uri, headers: apiKeyHeaders)).thenAnswer(
          (_) async => Response('body', 200),
        );

        final response = await subject.delete(path);

        verify(
          () => client.delete(uri, headers: apiKeyHeaders),
        ).called(1);
        expect(response.statusCode, 200);
        expect(response.body, 'body');
      });

      test('on a post request', () async {
        when(
          () => client.post(
            uri,
            headers: apiKeyHeaders,
            body: body,
          ),
        ).thenAnswer(
          (_) async => Response('body', 200),
        );

        await subject.post(path, body: body);

        verify(
          () => client.post(
            uri,
            headers: apiKeyHeaders,
            body: body,
          ),
        ).called(1);
      });

      test('on a put request', () async {
        when(
          () => client.put(
            uri,
            headers: apiKeyHeaders,
            body: body,
          ),
        ).thenAnswer(
          (_) async => Response('body', 200),
        );

        await subject.put(path, body: body);

        verify(
          () => client.put(
            uri,
            headers: apiKeyHeaders,
            body: body,
          ),
        ).called(1);
      });

      test('on a patch request', () async {
        when(
          () => client.patch(
            uri,
            headers: apiKeyHeaders,
            body: body,
          ),
        ).thenAnswer(
          (_) async => Response('body', 200),
        );

        await subject.patch(path, body: body);

        verify(
          () => client.patch(
            uri,
            headers: apiKeyHeaders,
            body: body,
          ),
        ).called(1);
      });
    });

    group('applies the options to the request', () {
      final uri = buildUri(path);
      final options = const ApiRequestOptions(
        headers: {
          'Authorization': 'Bearer token',
        },
      ).merge(const ApiRequestOptions(headers: apiKeyHeaders));

      test('on a get request', () async {
        when(
          () => client.get(uri, headers: options.headers),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.get(path, options: options);

        verify(() => client.get(uri, headers: options.headers)).called(1);
      });

      test('on a delete request', () async {
        when(
          () => client.delete(uri, headers: options.headers),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.delete(path, options: options);

        verify(() => client.delete(uri, headers: options.headers)).called(1);
      });

      test('on a post request', () async {
        when(
          () => client.post(
            uri,
            headers: options.headers,
            body: {'message': 'data'},
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.post(
          path,
          options: options,
          body: {'message': 'data'},
        );

        verify(
          () => client.post(
            uri,
            headers: options.headers,
            body: {'message': 'data'},
          ),
        ).called(1);
      });

      test('on a put request', () async {
        when(
          () => client.put(
            uri,
            headers: options.headers,
            body: {'message': 'data'},
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.put(
          path,
          options: options,
          body: {'message': 'data'},
        );

        verify(
          () => client.put(
            uri,
            headers: options.headers,
            body: {'message': 'data'},
          ),
        ).called(1);
      });
    });

    group('authenticated requests', () {
      final uri = buildUri('/some-api');

      test('adds the bearer to get request', () async {
        when(() => tokenProvider.fetchToken()).thenAnswer(
          (_) async => 'MyBearerToken',
        );
        when(
          () => client.get(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.authenticatedGet(path);
        verify(
          () => client.get(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
          ),
        ).called(1);
      });

      test('adds the bearer to delete request', () async {
        when(() => tokenProvider.fetchToken()).thenAnswer(
          (_) async => 'MyBearerToken',
        );
        when(
          () => client.delete(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.authenticatedDelete(path);
        verify(
          () => client.delete(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
          ),
        ).called(1);
      });

      test('adds the bearer to post request', () async {
        when(() => tokenProvider.fetchToken()).thenAnswer(
          (_) async => 'MyBearerToken',
        );
        when(
          () => client.post(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
            body: {'body'},
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.authenticatedPost(path, body: {'body'});
        verify(
          () => client.post(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
            body: {'body'},
          ),
        ).called(1);
      });

      test('adds the bearer to put request', () async {
        when(() => tokenProvider.fetchToken()).thenAnswer(
          (_) async => 'MyBearerToken',
        );
        when(
          () => client.put(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
            body: {'body'},
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.authenticatedPut(path, body: {'body'});
        verify(
          () => client.put(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
            body: {'body'},
          ),
        ).called(1);
      });

      test('adds the bearer to patch request', () async {
        when(() => tokenProvider.fetchToken()).thenAnswer(
          (_) async => 'MyBearerToken',
        );
        when(
          () => client.patch(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
            body: {'body'},
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.authenticatedPatch(path, body: {'body'});
        verify(
          () => client.patch(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
            },
            body: {'body'},
          ),
        ).called(1);
      });

      test('correctly merges options on a get request', () async {
        when(() => tokenProvider.fetchToken()).thenAnswer(
          (_) async => 'MyBearerToken',
        );
        when(
          () => client.get(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
              'message': 'data',
            },
          ),
        ).thenAnswer((_) async => Response('body', 200));

        await subject.authenticatedGet(
          path,
          options: const ApiRequestOptions(
            headers: {
              'message': 'data',
            },
          ),
        );
        verify(
          () => client.get(
            uri,
            headers: {
              'Accept': '*/*',
              'Authorization': 'Bearer MyBearerToken',
              'message': 'data',
            },
          ),
        ).called(1);
      });
    });

    group('ApiOptions', () {
      group('merge', () {
        test('creates a new instance with the merged attributes', () {
          const options1 = ApiRequestOptions(
            headers: {
              'Content-Type': 'json',
            },
          );
          const options2 = ApiRequestOptions(
            headers: {
              'Authorization': 'Bearer token',
            },
          );

          expect(
            options1.merge(options2),
            equals(
              const ApiRequestOptions(
                headers: {
                  'Content-Type': 'json',
                  'Authorization': 'Bearer token',
                },
              ),
            ),
          );
        });
        test('can handle null values', () {
          const options1 = ApiRequestOptions();
          const options2 = ApiRequestOptions();

          expect(
            options1.merge(options2).headers,
            isNull,
          );
        });
      });
    });
  });
}
