import 'package:empdesk/src/core/network/api_client.dart';

class AuthApiService {
  final ApiClient client;

  AuthApiService({required this.client});

  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    if (email == "admin@gmail.com" && password == "admin@123") {
      return {"id": "1", "name": "admin", "email": "admin@gmail.com"};
    } else {
      throw Exception("Login failed");
    }
  }

 
}
