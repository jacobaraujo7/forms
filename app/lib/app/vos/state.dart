import 'value_object.dart';

class State implements ValueObject {
  final String _value;

  State(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Campo State não pode ser vazio';
    }
    return null;
  }

  bool isValid() => validator() == null;

  @override
  String toString() => _value;
}
