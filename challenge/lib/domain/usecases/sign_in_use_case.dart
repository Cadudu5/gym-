import '../repositories/session_repository.dart';

class SignInUseCase {
  const SignInUseCase(this._repository);

  final SessionRepository _repository;

  Future<void> call() => _repository.signIn();
}
