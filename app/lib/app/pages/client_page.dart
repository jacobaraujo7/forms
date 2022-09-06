import 'package:app/app/stores/client_store.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final store = ClientStore();

  @override
  void initState() {
    super.initState();
    store.addListener(listener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.fetchAllClients();
    });
  }

  void listener() {
    setState(() {});
  }

  @override
  void dispose() {
    store.removeListener(listener);
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clients = store.clients;

    return Scaffold(
      appBar: AppBar(title: const Text('Client list')),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (_, index) {
          final client = clients[index];
          return ListTile(
            title: Text(client.name.toString()),
            onTap: () async {
              await Navigator.pushNamed(
                context,
                '/details',
                arguments: client,
              );
              store.fetchAllClients();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/details');
          store.fetchAllClients();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
