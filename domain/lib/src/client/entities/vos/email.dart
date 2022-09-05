import 'package:domain/src/core/value_object.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class Email implements ValueObject {
  final String _value;

  const Email(this._value);

  @override
  String? validator([Object? obj]) {
    if (_value.isEmpty) {
      return 'Email can\'t be empty ';
    }
    if (!string_validator.isEmail(_value)) {
      return 'Email is not valid';
    }
    return null;
  }

  @override
  String toString() => _value;
}
