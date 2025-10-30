import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final notifier = GoRouterRefreshNotifier(ref);
  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: SplashScreen.routePath,
    refreshListenable: notifier,
    routes: [
      GoRoute(
        path: SplashScreen.routePath,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.routePath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: HomeScreen.routePath,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    redirect: (context, state) {
      final status = ref.read(authControllerProvider).status;
      final location = state.uri.path;
      final isSplash = location == SplashScreen.routePath;
      final isLogin = location == LoginScreen.routePath;

      switch (status) {
        case AuthStatus.unknown:
        case AuthStatus.checking:
          return isSplash ? null : SplashScreen.routePath;
        case AuthStatus.unauthenticated:
          if (!isLogin) {
            return LoginScreen.routePath;
          }
          return null;
        case AuthStatus.authenticated:
          if (isSplash || isLogin) {
            return HomeScreen.routePath;
          }
          return null;
      }
    },
  );
});

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(this._ref) {
    _subscription = _ref.listen<AuthState>(
      authControllerProvider,
      (_, __) => notifyListeners(),
      fireImmediately: true,
    );
  }

  final Ref _ref;
  late final ProviderSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
