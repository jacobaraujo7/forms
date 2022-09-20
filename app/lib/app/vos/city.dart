import 'value_object.dart';

class City implements ValueObject {
  final String _value;

  City(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Campo City não pode ser vazio';
    }
    return null;
  }

  @override
  String toString() => _value;
}
