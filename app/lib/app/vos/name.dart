import 'package:app/app/vos/value_object.dart';

class Name implements ValueObject {
  final String _value;

  Name(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Campo name não pode ser vazio';
    }

    if (_value.split(' ').length < 2) {
      return 'Campo nome precisa de um sobrenome';
    }
    return null;
  }

  @override
  String toString() => _value;
}
