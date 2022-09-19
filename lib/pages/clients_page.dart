import 'dart:math';

import 'package:flutter/material.dart';

import 'package:bloc_pattern_with_packages_example/blocs/client_bloc.dart';
import 'package:bloc_pattern_with_packages_example/blocs/client_events.dart';
import 'package:bloc_pattern_with_packages_example/blocs/client_state.dart';
import 'package:bloc_pattern_with_packages_example/models/client_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return ['Maria Almeida', 'Vinicius Silva', 'Luiz Williams', 'Bianca Nevis']
        .elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            onPressed: () => bloc.add(
              AddClientEvent(
                client: ClientModel(
                  nome: randomName(),
                ),
              ),
            ),
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<ClientBloc, ClientState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ClientInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemCount: state.clients.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(
                      state.clients[index].nome.substring(0, 1),
                    ),
                  ),
                ),
                title: Text(state.clients[index].nome),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => bloc.add(
                    RemoveClientEvent(
                      client: state.clients[index],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
