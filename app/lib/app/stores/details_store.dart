import 'package:flutter/cupertino.dart';
import 'package:uno/uno.dart';

import '../entities/client.dart';
import '../models/cidade_estado.dart';

enum DetailsState { saveError, saveSuccess, idle }

class DetailsStore extends ChangeNotifier {
  DetailsStore() {
    _loadStates();
  }

  final uno = Uno();

  var state = DetailsState.idle;

  var stateList = <Estado>[];
  var citiesList = <String>[];

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

  void stateSelected(Estado estado) {
    citiesList.clear();
    citiesList.addAll(estado.cidades);
    notifyListeners();
  }

  void _loadStates() {
    stateList = Estado.getAllStates();
  }
}
