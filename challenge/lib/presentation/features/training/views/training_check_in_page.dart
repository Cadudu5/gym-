import 'package:flutter/material.dart';

class TrainingCheckInPage extends StatelessWidget {
  const TrainingCheckInPage({super.key});

  static const String path = '/training/check-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar treino')),
      body: const Center(child: Text('Registro de treino placeholder')),
    );
  }
}
