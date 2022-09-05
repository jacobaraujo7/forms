import 'vos/address.dart';
import 'vos/cpf.dart';
import 'vos/email.dart';
import 'vos/name.dart';

class Client {
  final int id;
  final DateTime? createdAt;
  final Email email;
  final Name name;
  final Address address;
  final Cpf cpf;

  Client({
    required this.id,
    required this.createdAt,
    required this.email,
    required this.name,
    required this.address,
    required this.cpf,
  });
}
