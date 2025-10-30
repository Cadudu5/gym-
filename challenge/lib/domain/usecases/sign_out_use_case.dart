import '../repositories/session_repository.dart';

class SignOutUseCase {
  const SignOutUseCase(this._repository);

  final SessionRepository _repository;

  Future<void> call() => _repository.signOut();
}
