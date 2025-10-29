import 'package:flutter/material.dart';

class CreateCompetitionPage extends StatelessWidget {
  const CreateCompetitionPage({super.key});

  static const String path = '/competitions/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar competição')),
      body: const Center(child: Text('Formulário de criação placeholder')),
    );
  }
}
