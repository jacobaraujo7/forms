import 'package:app/app/vos/value_object.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Cpf implements ValueObject {
  final String _value;

  Cpf(this._value);

  @override
  String? validator() {
    if (!CPFValidator.isValid(_value)) {
      return 'CPF não é válido';
    }
    return null;
  }

  @override
  String toString() => _value;

  String toStringOnlyNumbers() => _value.replaceAll(RegExp(r'[^\d]'), '');
}
