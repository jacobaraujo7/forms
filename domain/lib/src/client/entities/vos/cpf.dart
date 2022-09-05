import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:domain/src/core/value_object.dart';

class Cpf implements ValueObject {
  final String _value;

  const Cpf(this._value);

  @override
  String? validator([Object? obj]) {
    if (_value.isEmpty) {
      return 'CPF Don\'t be empty';
    }

    if (!CPFValidator.isValid(_value)) {
      return 'CPF not valid';
    }
    return null;
  }

  @override
  String toString() => _value;
}
