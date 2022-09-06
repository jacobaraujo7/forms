import 'package:flutter/cupertino.dart';
import 'package:uno/uno.dart';

import '../entities/client.dart';

enum DetailsState { saveError, saveSuccess, idle }

class DetailsStore extends ChangeNotifier {
  final uno = Uno();

  var state = DetailsState.idle;

  Future<void> createClient(Client client) async {
    try {
      await uno.post(
        'http://localhost:4444/client',
        data: client.toJson(),
      );
      state = DetailsState.saveSuccess;
    } catch (e) {
      state = DetailsState.saveError;
    }

    notifyListeners();
  }

  Future<void> updateClient(Client client) async {
    try {
      await uno.put(
        'http://localhost:4444/client',
        data: client.toJson(),
      );
      state = DetailsState.saveSuccess;
    } catch (e) {
      state = DetailsState.saveError;
    }

    notifyListeners();
  }
}
