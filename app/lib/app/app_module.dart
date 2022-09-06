import 'package:flutter_modular/flutter_modular.dart';

import 'pages/client_page.dart';
import 'pages/details_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const ClientPage()),
    ChildRoute('/details', child: (_, args) {
      return DetailsPage(client: args.data);
    }),
  ];
}
