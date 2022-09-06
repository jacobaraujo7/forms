import 'package:flutter/cupertino.dart';
import 'package:uno/uno.dart';

import '../entities/client.dart';

class ClientStore extends ChangeNotifier {
  final uno = Uno();

  var clients = <Client>[];

  Future<void> fetchAllClients() async {
    final response = await uno.get('http://localhost:4444/client');
    final list = response.data as List;

    clients = list.map(Client.fromJson).toList();
    notifyListeners();
  }
}
