import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String employeeId;
  final String name;
  final String position;
  final String? email;
  final String role;
  final String department;
  final String phone;
  final bool isActive;
  final DateTime dateOfJoining;
  final int yearsInOrg;
  final bool isFlagged;

  const Employee({
    required this.employeeId,
    required this.name,
    required this.position,
    required this.email,
    required this.role,
    required this.department,
    required this.phone,
    required this.isActive,
    required this.dateOfJoining,
    required this.yearsInOrg,
    required this.isFlagged,
  });

  @override
  List<Object?> get props => [
        employeeId,
        name,
        position,
        email,
        role,
        department,
        phone,
        isActive,
        dateOfJoining,
        yearsInOrg,
        isFlagged,
      ];
}
