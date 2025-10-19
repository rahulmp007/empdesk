// lib/features/authentication/domain/usecases/get_current_user.dart
import 'package:dartz/dartz.dart';
import 'package:empdesk/src/core/error/error.dart';
import 'package:empdesk/src/features/auth/domain/entity/user.dart';
import 'package:empdesk/src/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;
  GetCurrentUser({required this.repository});

  Future<Either<Failure, User?>> call() {
    return repository.getCurrentUser();
  }
}
