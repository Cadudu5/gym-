import '../repositories/session_repository.dart';

class CheckActiveSessionUseCase {
  const CheckActiveSessionUseCase(this._repository);

  final SessionRepository _repository;

  Future<bool> call() => _repository.hasActiveSession();
}
