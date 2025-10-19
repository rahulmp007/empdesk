import 'package:dartz/dartz.dart';
import 'package:empdesk/src/core/error/error.dart';
import 'package:empdesk/src/features/employee/data/mappers/employee_mapper.dart';

import '../../domain/entities/employee.dart';
import '../../domain/repositories/employee_repository.dart';
import '../datasources/employee_remote_datasource.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;
  EmployeeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Employee>>> getAllEmployees() async {
    final models = await remoteDataSource.fetchEmployees();
    final items = models.map((e) => EmployeeMapper.toEntity(e)).toList();
    return right(items);
  }
}
