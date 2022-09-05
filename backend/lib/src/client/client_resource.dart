import 'dart:async';
import 'dart:convert';

import 'package:backend/src/generated/prisma_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'repositories/client_repository.dart';

class ClienteResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/client', _getAll),
        Route.get('/client/:id', _get),
        Route.post('/client', _create),
        Route.put('/client', _update),
        Route.delete('/client/:id', _delete),
      ];

  FutureOr<Response> _get(Injector injector, ModularArguments arguments) async {
    final repository = injector.get<ClientRepository>();

    final id = int.parse(arguments.params['id']!);

    final client = await repository.get(id);
    return Response.ok(jsonEncode(client?.toJson() ?? {}));
  }

  FutureOr<Response> _getAll(Injector injector) async {
    final repository = injector.get<ClientRepository>();
    final clients = await repository.getAll();
    final mapList = clients.map((e) => e.toJson()).toList();
    return Response.ok(jsonEncode(mapList));
  }

  FutureOr<Response> _create(Injector injector, ModularArguments arguments) async {
    final repository = injector.get<ClientRepository>();
    final data = arguments.data;
    final input = ClientCreateInput(
      email: data['email'],
      name: data['name'],
      cpf: data['cpf'],
      city: data['city'],
      state: data['state'],
    );

    final client = await repository.create(input);
    return Response.ok(jsonEncode(client.toJson()));
  }

  FutureOr<Response> _update(Injector injector, ModularArguments arguments) async {
    final repository = injector.get<ClientRepository>();
    final data = arguments.data;
    final id = data['id']!;

    final input = ClientUpdateInput(
      name: data['name'] != null ? PrismaUnion.zero(data['name']) : null,
      cpf: data['cpf'] != null ? PrismaUnion.zero(data['cpf']) : null,
      city: data['city'] != null ? PrismaUnion.zero(data['city']) : null,
      state: data['state'] != null ? PrismaUnion.zero(data['state']) : null,
    );

    final client = await repository.update(id, input);
    return Response.ok(jsonEncode(client?.toJson() ?? {}));
  }

  FutureOr<Response> _delete(Injector injector, ModularArguments arguments) async {
    final repository = injector.get<ClientRepository>();
    final id = int.parse(arguments.params['id']!);
    final client = await repository.delete(id);
    return Response.ok(jsonEncode(client?.toJson() ?? {}));
  }
}
