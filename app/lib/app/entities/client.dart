import 'package:app/app/vos/city.dart';
import 'package:app/app/vos/state.dart';

import '../vos/cpf.dart';
import '../vos/email.dart';
import '../vos/name.dart';

class Client {
  int id;
  DateTime? createdAt;
  Email _email;
  Name _name;
  Cpf _cpf;
  City _city;
  State _state;

  City get city => _city;
  void setCity(String? value) => _city = City(value ?? '');

  State get state => _state;
  void setState(String? value) => _state = State(value ?? '');

  Cpf get cpf => _cpf;
  void setCpf(String? value) => _cpf = Cpf(value ?? '');

  Name get name => _name;
  void setName(String? value) => _name = Name(value ?? '');

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Client({
    required this.id,
    this.createdAt,
    required String email,
    required String name,
    required String cpf,
    required String city,
    required String state,
  })  : _email = Email(email),
        _cpf = Cpf(cpf),
        _city = City(city),
        _state = State(state),
        _name = Name(name);

  factory Client.empty() {
    return Client(
      city: '',
      cpf: '',
      email: '',
      id: -1,
      name: '',
      state: '',
    );
  }

  static Client fromJson(dynamic data) {
    return Client(
      id: data['id'],
      createdAt: data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
      email: data['email'],
      name: data['name'],
      cpf: data['cpf'],
      city: data['city'],
      state: data['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != -1) 'id': id,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      'email': email.toString(),
      'name': name.toString(),
      'cpf': cpf.toString(),
      'city': city.toString(),
      'state': state.toString(),
    };
  }
}
