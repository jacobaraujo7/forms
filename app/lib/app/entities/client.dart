import '../vos/cpf.dart';
import '../vos/email.dart';
import '../vos/name.dart';

class Client {
  int id;
  DateTime? createdAt;
  Email _email;
  Name _name;
  Cpf _cpf;
  String city;
  String state;

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
    required this.city,
    required this.state,
  })  : _email = Email(email),
        _cpf = Cpf(cpf),
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
