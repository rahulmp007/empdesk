import 'package:flutter/material.dart';
import '../../domain/entities/employee.dart';

class EmployeeListItem extends StatelessWidget {
  final Employee employee;
  const EmployeeListItem({super.key, required this.employee});

  Color? _bgColor(BuildContext context) {
    return employee.isFlagged ? Colors.green.withOpacity(0.12) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: employee.isFlagged ? Colors.green : Colors.grey.shade300,
        ),
      ),
      child: ListTile(
        title: Text(
          employee.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('${employee.position} • ${employee.yearsInOrg} yrs'),
        trailing: employee.isFlagged ? const _FlagChip() : null,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

class _FlagChip extends StatelessWidget {
  const _FlagChip();
  @override
  Widget build(BuildContext context) {
    return const Chip(
      label: Text('active'),
      backgroundColor: Colors.green,
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}
