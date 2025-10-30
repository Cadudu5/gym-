import 'dart:async';

import '../../domain/repositories/session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  const SessionRepositoryImpl();

  @override
  Future<bool> hasActiveSession() async {
    await Future.delayed(const Duration(seconds: 2));
    // SUPABASE AUTH: Replace this simulation with a call to Supabase to retrieve the persisted session.
    return false;
  }

  @override
  Future<void> signIn() async {
    await Future.delayed(const Duration(seconds: 1));
    // SUPABASE AUTH: Hook the Supabase sign-in flow here (e.g., magic link or OAuth providers).
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // SUPABASE AUTH: Invoke Supabase signOut when session handling is available.
  }
}
