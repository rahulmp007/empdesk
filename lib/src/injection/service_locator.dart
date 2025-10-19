import 'package:empdesk/src/core/constants/app_config.dart';
import 'package:empdesk/src/core/network/api_client.dart';
import 'package:empdesk/src/core/service/hive_service.dart';
import 'package:empdesk/src/core/service/local_storage_service.dart';
import 'package:empdesk/src/features/auth/data/data_sources/auth_api_source.dart';
import 'package:empdesk/src/features/auth/data/data_sources/auth_local_source.dart';
import 'package:empdesk/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:empdesk/src/features/auth/domain/repository/auth_repository.dart';
import 'package:empdesk/src/features/auth/domain/usecases/get_current_user.dart';
import 'package:empdesk/src/features/auth/domain/usecases/login_user.dart';
import 'package:empdesk/src/features/employee/data/datasources/employee_remote_datasource.dart';
import 'package:empdesk/src/features/employee/data/repositories/employee_repository_impl.dart';
import 'package:empdesk/src/features/employee/domain/repositories/employee_repository.dart';
import 'package:empdesk/src/features/employee/domain/usecases/get_all_employees.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // api client
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(baseUrl: AppConfig.baseUrl),
  );

  /// local storage
  sl.registerLazySingleton<LocalStorageService>(() => LocalStorageService());

  /// hive services
  sl.registerLazySingleton<HiveService>(() => HiveService());

  // employee remote data source
  sl.registerLazySingleton<EmployeeRemoteDataSource>(
    () => EmployeeRemoteDataSource(client: sl<ApiClient>()),
  );

  // employee repository
  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(
      remoteDataSource: sl<EmployeeRemoteDataSource>(),
    ),
  );

  // employee usecase
  sl.registerLazySingleton<GetAllEmployees>(
    () => GetAllEmployees(sl<EmployeeRepository>()),
  );

  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiService(client: sl<ApiClient>()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(localStorage: sl<LocalStorageService>()),
  );

  /// repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      api: sl<AuthApiService>(),
      local: sl<AuthLocalDataSource>(),
    ),
  );

  sl.registerLazySingleton<LoginUser>(
    () => LoginUser(repository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton<GetCurrentUser>(
    () => GetCurrentUser(repository: sl<AuthRepository>()),
  );
}
