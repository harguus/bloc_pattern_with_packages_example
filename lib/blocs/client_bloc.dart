import 'package:bloc/bloc.dart';

import 'package:bloc_pattern_with_packages_example/blocs/client_events.dart';
import 'package:bloc_pattern_with_packages_example/blocs/client_state.dart';
import 'package:bloc_pattern_with_packages_example/repositories/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvents, ClientState> {
  final _clientRepository = ClientsRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(
          clients: _clientRepository.loadClients(),
        ),
      ),
    );

    on<AddClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(
          clients: _clientRepository.addClient(event.client),
        ),
      ),
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(
          clients: _clientRepository.removeClient(event.client),
        ),
      ),
    );
  }
}
