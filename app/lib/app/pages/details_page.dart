import 'package:app/app/models/cidade_estado.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/my_edit_text.dart';
import '../entities/client.dart';
import '../stores/details_store.dart';

class DetailsPage extends StatefulWidget {
  final Client? client;
  const DetailsPage({super.key, this.client});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  late Client client;
  final store = DetailsStore();

  @override
  void initState() {
    super.initState();

    if (widget.client == null) {
      client = Client.empty();
    } else {
      client = widget.client!;
      final estado = store.stateList.firstWhere(
        (estado) => estado.nome == client.state.toString(),
      );

      store.stateSelected(estado);
    }

    store.addListener(() {
      if (store.state == DetailsState.idle) {
        setState(() {});
      } else if (store.state == DetailsState.saveSuccess) {
        Navigator.pop(context);
      } else {
        showSnackbarError('Ocorreu um erro no servidor');
      }
    });
  }

  void showSnackbarError(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var name = client.name.toString();
    name = name.isEmpty ? 'Novo usuário' : name;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              MyEditText(
                label: 'Name',
                value: client.name.toString(),
                validator: (v) => client.name.validator(),
                onChanged: client.setName,
              ),
              const SizedBox(height: 8),
              MyEditText(
                label: 'Email',
                value: client.email.toString(),
                validator: (v) => client.email.validator(),
                onChanged: client.setEmail,
              ),
              const SizedBox(height: 8),
              MyEditText(
                label: 'CPF',
                value: client.cpf.toString(),
                validator: (v) => client.cpf.validator(),
                onChanged: client.setCpf,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
              ),
              const SizedBox(height: 8),
              // MyEditText(
              //   label: 'State',
              //   value: client.state,
              //   validator: (v) {
              //     if (client.state.isEmpty) {
              //       return 'esse campo não pode ser vazio';
              //     }
              //     return null;
              //   },
              //   onChanged: (v) => client.state = v,
              // ),
              // const SizedBox(height: 8),
              // MyEditText(
              //   label: 'City',
              //   value: client.city,
              //   validator: (v) {
              //     if (client.city.isEmpty) {
              //       return 'esse campo não pode ser vazio';
              //     }
              //     return null;
              //   },
              //   onChanged: (v) => client.city = v,
              // ),
              const SizedBox(height: 8),
              DropdownButtonFormField<Estado>(
                value: client.state.toString().isEmpty ? null : Estado.withName(client.state.toString()),
                validator: (s) => client.state.validator(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Selecione o estado',
                ),
                items: store.stateList.map((estado) {
                  return DropdownMenuItem(
                    value: estado,
                    child: Text(estado.nome),
                  );
                }).toList(),
                onChanged: (estado) {
                  if (estado != null) {
                    client.setState(estado.nome);
                    client.setCity('');
                    store.stateSelected(estado);
                  }
                },
              ),
              const SizedBox(height: 8),
              if (client.state.isValid())
                DropdownButtonFormField<String>(
                  value: client.city.toString().isEmpty ? null : client.city.toString(),
                  validator: (s) => client.city.validator(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Selecione o município',
                  ),
                  items: store.citiesList.map((city) {
                    return DropdownMenuItem(
                      value: city.toString(),
                      child: Text(city.toString()),
                    );
                  }).toList(),
                  onChanged: (city) {
                    if (city != null) {
                      client.setCity(city);
                    }
                  },
                ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  final valid = form.validate();

                  if (valid) {
                    if (client.id == -1) {
                      store.createClient(client);
                    } else {
                      store.updateClient(client);
                    }
                  } else {
                    showSnackbarError('Campos invalidos');
                  }
                },
                child: const Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
