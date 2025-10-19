import 'package:empdesk/src/features/employee/domain/entities/employee.dart';
import 'package:empdesk/src/features/employee/presentation/widgets/employee_list_item.dart';
import 'package:flutter/material.dart';

class EmployeeListView extends StatelessWidget {
  final List<Employee> employees;
  const EmployeeListView({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) =>
          EmployeeListItem(employee: employees[index]),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: employees.length,
    );
  }
}
