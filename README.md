# empdesk 

This Flutter application displays a list of employees fetched from a backend API. Each employee’s details, such as name, position, and date of joining, are shown in a clean and responsive UI. Employees who have been with the organization for more than five years **and are currently active** are visually highlighted in **green** to indicate their long-term association.

---

## ⚙️ Project Overview

The app connects to a backend API that provides employee data. The backend is  developed using  **Node.js**. The Flutter app sends a GET request to the `/api/v1/employee/` endpoint to retrieve all employees and then applies the business logic on the client side to flag eligible employees.

---

## 🌐 API Configuration

To ensure smooth communication between your Flutter app and the backend, set the base URL according to your environment inside the `AppConfig` class:

```dart
class AppConfig {
  static const String baseUrl = 'http://10.0.2.2:4000';
}

// Android Emulator: use http://10.0.2.2:4000/api/v1/employee/
// iOS Simulator: use http://localhost:4000/api/v1/employee/
// Physical Device: use your computer’s local IP, e.g. http://192.168.1.100:4000/api/v1/employee/
