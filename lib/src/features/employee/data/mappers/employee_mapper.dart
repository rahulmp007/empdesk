import 'package:empdesk/src/features/employee/data/models/employee_model.dart';
import 'package:empdesk/src/features/employee/domain/entities/employee.dart';

class EmployeeMapper {
  static EmployeeModel fromEntity(Employee entity) {
    return EmployeeModel(
      employeeId: entity.employeeId,
      name: entity.name,
      position: entity.position,
      email: entity.email,
      role: entity.role,
      department: entity.department,
      phone: entity.phone,
      isActive: entity.isActive,
      dateOfJoining: entity.dateOfJoining,
    );
  }

  static Employee toEntity(EmployeeModel model) {
    final yearsInOrg = _calculateYearsBetween(
      model.dateOfJoining,
      DateTime.now(),
    );
    final isFlagged = model.isActive && yearsInOrg >= 5;

    return Employee(
      employeeId: model.employeeId,
      name: model.name,
      position: model.position,
      email: model.email,
      role: model.role,
      department: model.department,
      phone: model.phone,
      isActive: model.isActive,
      dateOfJoining: model.dateOfJoining,
      yearsInOrg: yearsInOrg,
      isFlagged: isFlagged,
    );
  }

  static int _calculateYearsBetween(DateTime from, DateTime to) {
    int years = to.year - from.year;
    if (to.month < from.month ||
        (to.month == from.month && to.day < from.day)) {
      years--;
    }
    return years;
  }
}
