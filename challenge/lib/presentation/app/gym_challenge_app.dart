import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_router.dart';
import '../theme/app_theme.dart';

class GymChallengeApp extends ConsumerWidget {
  const GymChallengeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'GymChallenge',
      routerConfig: router,
      themeMode: ThemeMode.dark,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
    );
  }
}
