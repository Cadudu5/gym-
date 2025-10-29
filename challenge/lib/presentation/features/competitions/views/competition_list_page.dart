import 'package:flutter/material.dart';

class CompetitionListPage extends StatelessWidget {
  const CompetitionListPage({super.key});

  static const String path = '/competitions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Competições')),
      body: const Center(child: Text('Lista de competições placeholder')),
    );
  }
}
