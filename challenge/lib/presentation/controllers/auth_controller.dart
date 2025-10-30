import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/session_repository_impl.dart';
import '../../domain/repositories/session_repository.dart';
import '../../domain/usecases/check_active_session_use_case.dart';
import '../../domain/usecases/sign_in_use_case.dart';
import '../../domain/usecases/sign_out_use_case.dart';

enum AuthStatus { unknown, checking, authenticated, unauthenticated }

class AuthState {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.errorMessage,
  });

  final AuthStatus status;
  final String? errorMessage;

  AuthState copyWith({AuthStatus? status, String? errorMessage}) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController(
    this._checkActiveSessionUseCase,
    this._signInUseCase,
    this._signOutUseCase,
  ) : super(const AuthState()) {
    checkSession();
  }

  final CheckActiveSessionUseCase _checkActiveSessionUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  Future<void> checkSession() async {
    state = const AuthState(status: AuthStatus.checking);
    try {
      final hasSession = await _checkActiveSessionUseCase();
      state = AuthState(
        status: hasSession ? AuthStatus.authenticated : AuthStatus.unauthenticated,
      );
    } catch (error) {
      state = AuthState(status: AuthStatus.unauthenticated, errorMessage: '$error');
    }
  }

  Future<void> signIn() async {
    state = const AuthState(status: AuthStatus.checking);
    try {
      await _signInUseCase();
      state = const AuthState(status: AuthStatus.authenticated);
    } catch (error) {
      state = AuthState(status: AuthStatus.unauthenticated, errorMessage: '$error');
    }
  }

  Future<void> signOut() async {
    state = const AuthState(status: AuthStatus.checking);
    try {
      await _signOutUseCase();
      state = const AuthState(status: AuthStatus.unauthenticated);
    } catch (error) {
      state = AuthState(status: AuthStatus.authenticated, errorMessage: '$error');
    }
  }
}

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return const SessionRepositoryImpl();
});

final checkActiveSessionUseCaseProvider = Provider<CheckActiveSessionUseCase>((ref) {
  return CheckActiveSessionUseCase(ref.watch(sessionRepositoryProvider));
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(sessionRepositoryProvider));
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(ref.watch(sessionRepositoryProvider));
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(
    ref.watch(checkActiveSessionUseCaseProvider),
    ref.watch(signInUseCaseProvider),
    ref.watch(signOutUseCaseProvider),
  );
});
