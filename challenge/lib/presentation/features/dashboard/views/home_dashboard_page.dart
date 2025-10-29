import 'package:flutter/material.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  static const String path = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gym Challenge')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [Text('Dashboard placeholder')],
      ),
    );
  }
}
