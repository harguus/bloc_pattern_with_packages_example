import 'package:bloc_pattern_with_packages_example/models/client_model.dart';

abstract class ClientEvents {}

class LoadClientEvent extends ClientEvents {}

class AddClientEvent extends ClientEvents {
  ClientModel client;

  AddClientEvent({
    required this.client,
  });
}

class RemoveClientEvent extends ClientEvents {
  ClientModel client;

  RemoveClientEvent({
    required this.client,
  });
}
