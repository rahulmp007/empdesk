import 'package:empdesk/src/features/employee/domain/usecases/get_all_employees.dart';
import 'package:empdesk/src/features/employee/presentation/bloc/employee/employee_bloc.dart';
import 'package:empdesk/src/features/employee/presentation/bloc/employee/employee_event.dart';
import 'package:empdesk/src/features/employee/presentation/bloc/employee/employee_state.dart';
import 'package:empdesk/src/features/employee/presentation/widgets/employees_list.dart';
import 'package:empdesk/src/injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Employees'),
        scrolledUnderElevation: 0,
      ),
      body: BlocProvider<EmployeeBloc>(
        create: (context) =>
            EmployeeBloc(getAllEmployees: sl<GetAllEmployees>())
              ..add(LoadEmployees()),
        child: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            switch (state.status) {
              case EmployeeStatus.loading || EmployeeStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case EmployeeStatus.failure:
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      state.error ?? 'Something went wrong',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              case EmployeeStatus.loaded:
                final employees = state.employees;
                if (employees.isEmpty) {
                  return const Center(child: Text('No employees found'));
                }
                return EmployeeListView(employees: employees);
            }
          },
        ),
      ),
    );
  }
}
