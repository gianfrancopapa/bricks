import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final method = context.request.method;

  if (method == HttpMethod.get) {
    return _onGetRequest(context);
  }
  if (method == HttpMethod.put) {
    return _onPutRequest(context);
  }
  if (method == HttpMethod.delete) {
    return _onDeleteRequest(context);
  }

  return Response(statusCode: HttpStatus.methodNotAllowed);
}

Future<Response> _onGetRequest(RequestContext context) async {
  return Response.json(
    body: [
      {'message:': 'GET'}
    ],
  );
}

Future<Response> _onPutRequest(RequestContext context) async {
  return Response.json(
    body: [
      {'message:': 'PUT'}
    ],
  );
}

Future<Response> _onDeleteRequest(RequestContext context) async {
  return Response.json(
    body: [
      {'message:': 'DELETE'}
    ],
  );
}
