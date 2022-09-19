import 'package:flutter/material.dart';

import 'package:bloc_pattern_with_packages_example/pages/clients_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc Pattern Example',
      debugShowCheckedModeBanner: false,
      home: ClientsPage(),
    );
  }
}
