import 'package:dartz/dartz.dart';
import 'package:empdesk/src/core/error/error.dart';
import 'package:empdesk/src/features/employee/domain/entities/employee.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getAllEmployees();
}
