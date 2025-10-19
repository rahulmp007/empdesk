
import 'package:empdesk/src/features/employee/domain/usecases/get_all_employees.dart';
import 'package:empdesk/src/features/employee/presentation/bloc/employee/employee_event.dart';
import 'package:empdesk/src/features/employee/presentation/bloc/employee/employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetAllEmployees getAllEmployees;

  EmployeeBloc({required this.getAllEmployees}) : super(const EmployeeState()) {
    on<LoadEmployees>(_onLoad);
  }

  Future<void> _onLoad(LoadEmployees event, Emitter<EmployeeState> emit) async {
    emit(state.copyWith(status: EmployeeStatus.loading));
    try {
      final result = await getAllEmployees.call();
      result.fold(
        (failure) {
          emit(state.copyWith(status: EmployeeStatus.loaded, employees: []));
        },
        (employees) {
          emit(
            state.copyWith(status: EmployeeStatus.loaded, employees: employees),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.failure, error: e.toString()));
    }
  }
}
