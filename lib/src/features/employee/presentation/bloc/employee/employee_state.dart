import 'package:equatable/equatable.dart';
import 'package:empdesk/src/features/employee/domain/entities/employee.dart';

enum EmployeeStatus { initial, loading, loaded, failure }

class EmployeeState extends Equatable {
  final EmployeeStatus status;
  final List<Employee> employees;
  final String? error;
  final int currentPage;
  final bool hasReachedMax;
  final int pageSize;

  const EmployeeState({
    this.status = EmployeeStatus.initial,
    this.employees = const [],
    this.error,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.pageSize = 20, // default page size
  });

  EmployeeState copyWith({
    EmployeeStatus? status,
    List<Employee>? employees,
    String? error,
    int? currentPage,
    bool? hasReachedMax,
    int? pageSize,
  }) {
    return EmployeeState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      error: error,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [
    status,
    employees,
    error,
    currentPage,
    hasReachedMax,
    pageSize,
  ];
}
