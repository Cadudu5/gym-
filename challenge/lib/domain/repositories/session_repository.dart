abstract class SessionRepository {
  Future<bool> hasActiveSession();
  Future<void> signIn();
  Future<void> signOut();
}
