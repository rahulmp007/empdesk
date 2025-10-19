class EmployeeModel {
  final String employeeId;
  final String name;
  final String position;
  final String? email;
  final String role;
  final String department;
  final String phone;
  final bool isActive;
  final DateTime dateOfJoining;

  EmployeeModel({
    required this.employeeId,
    required this.name,
    required this.position,
    this.email,
    required this.role,
    required this.department,
    required this.phone,
    required this.isActive,
    required this.dateOfJoining,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      employeeId: json['employeeId'] ?? '',
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      department: json['department'] ?? '',
      phone: json['phone'] ?? '',
      isActive: json['isActive'] ?? true,
      dateOfJoining: DateTime.parse(json['dateOfJoining']),
    );
  }

  Map<String, dynamic> toJson() => {
    'employeeId': employeeId,
    'name': name,
    'position': position,
    'email': email,
    'role': role,
    'department': department,
    'phone': phone,
    'isActive': isActive,
    'dateOfJoining': dateOfJoining.toIso8601String(),
  };
}
