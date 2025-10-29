import 'package:flutter/material.dart';

class CompetitionRankingPage extends StatelessWidget {
  const CompetitionRankingPage({super.key});

  static const String path = '/competitions/ranking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ranking')),
      body: const Center(child: Text('Ranking placeholder')),
    );
  }
}
