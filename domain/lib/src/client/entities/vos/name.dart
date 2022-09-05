import 'package:domain/src/core/value_object.dart';

class Name implements ValueObject {
  final String _value;

  Name(this._value);

  @override
  String? validator([Object? obj]) {
    if (_value.isEmpty) {
      return 'Name don\'t be empty';
    }
    return null;
  }

  @override
  String toString() => _value;
}
