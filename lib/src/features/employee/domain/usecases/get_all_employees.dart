import 'package:dartz/dartz.dart';
import 'package:empdesk/src/core/error/error.dart';
import 'package:empdesk/src/features/employee/domain/entities/employee.dart';
import 'package:empdesk/src/features/employee/domain/repositories/employee_repository.dart';

class GetAllEmployees {
  final EmployeeRepository repository;
  const GetAllEmployees(this.repository);

  Future<Either<Failure, List<Employee>>> call() =>
      repository.getAllEmployees();
}
