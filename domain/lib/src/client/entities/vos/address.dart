import 'package:domain/src/core/value_object.dart';

class Address implements ValueObject {
  final String city;
  final String state;

  Address(this.city, this.state);

  @override
  String? validator([Object? obj]) {
    if (city.isEmpty) {
      return 'City don\'t be empty';
    }

    if (state.isEmpty) {
      return 'State don\'t be empty';
    }
    return null;
  }
}
