import 'package:backend/src/client/repositories/client_repository.dart';
import 'package:backend/src/generated/prisma_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'client/client_resource.dart';
import 'swagger/swagger.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => PrismaClient()),
    Bind.singleton((i) => ClientRepository(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    Route.get('/', () => Response.ok('Server Online!')),
    Route.get('/doc/**', swaggerHandler()),
    Route.resource(ClienteResource()),
  ];
}
