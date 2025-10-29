import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/features/auth/views/splash_page.dart';
import '../presentation/features/dashboard/views/home_dashboard_page.dart';
import '../presentation/features/auth/views/sign_in_page.dart';
import '../presentation/features/competitions/views/competition_list_page.dart';
import '../presentation/features/competitions/views/create_competition_page.dart';
import '../presentation/features/training/views/training_check_in_page.dart';
import '../presentation/features/ranking/views/competition_ranking_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: SplashPage.path,
    routes: [
      GoRoute(
        path: SplashPage.path,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: SignInPage.path,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: HomeDashboardPage.path,
        builder: (context, state) => const HomeDashboardPage(),
      ),
      GoRoute(
        path: CompetitionListPage.path,
        builder: (context, state) => const CompetitionListPage(),
      ),
      GoRoute(
        path: CreateCompetitionPage.path,
        builder: (context, state) => const CreateCompetitionPage(),
      ),
      GoRoute(
        path: TrainingCheckInPage.path,
        builder: (context, state) => const TrainingCheckInPage(),
      ),
      GoRoute(
        path: CompetitionRankingPage.path,
        builder: (context, state) => const CompetitionRankingPage(),
      ),
    ],
    redirect: (context, state) {
      // TODO: plug authentication guard when auth flow is implemented.
      return null;
    },
    refreshListenable: GoRouterRefreshStream(Stream<void>.empty()),
  );
});

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(this.stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  final Stream<Object?> stream;
  late final StreamSubscription<Object?> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
