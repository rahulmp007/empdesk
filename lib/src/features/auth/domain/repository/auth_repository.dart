import 'package:dartz/dartz.dart';
import 'package:empdesk/src/core/error/error.dart';
import 'package:empdesk/src/features/auth/domain/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User?>> getCurrentUser();
}
