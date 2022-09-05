import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'src/app_module.dart';

Handler startServer() {
  final modular = Modular(
    module: AppModule(),
    middlewares: [
      jsonMiddleware(),
    ],
  );
  return modular;
}

Middleware jsonMiddleware() {
  return (handler) {
    return (request) async {
      var response = await handler(request);
      if (!response.headers.containsKey(HttpHeaders.contentTypeHeader) ||
          //
          response.headers[HttpHeaders.contentTypeHeader] == 'application/octet-stream; charset=utf-8') {
        response = response.change(headers: {
          ...response.headers,
          HttpHeaders.contentTypeHeader: 'text/json; charset=utf-8',
        });
      }
      return response;
    };
  };
}
