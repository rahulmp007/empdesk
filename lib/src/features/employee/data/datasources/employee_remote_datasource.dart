import 'dart:developer';
import 'package:empdesk/src/core/network/api_client.dart';
import '../models/employee_model.dart';

class EmployeeRemoteDataSource {
  final ApiClient client;

  EmployeeRemoteDataSource({required this.client});

  Future<List<EmployeeModel>> fetchEmployees() async {
    try {
      final result = await client.get(url: 'api/v1/employee/');
      log(result.toString());
      final data = (result['data'] ?? []) as List<dynamic>;
      return data
          .map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
