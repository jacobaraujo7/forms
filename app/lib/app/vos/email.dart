import 'package:string_validator/string_validator.dart' as string_validator;

import 'value_object.dart';

class Email implements ValueObject {
  final String _value;

  Email(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Campo email não pode ser vazio';
    }

    if (!string_validator.isEmail(_value)) {
      return 'Email inválido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
