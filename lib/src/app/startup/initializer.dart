import 'package:empdesk/src/app/app.dart';
import 'package:empdesk/src/app/bloc_observer.dart';
import 'package:empdesk/src/app/startup/bloc/app_startup_bloc.dart';
import 'package:empdesk/src/app/startup/bloc/app_startup_event.dart';
import 'package:empdesk/src/core/service/hive_service.dart';
import 'package:empdesk/src/features/auth/domain/usecases/get_current_user.dart';
import 'package:empdesk/src/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:empdesk/src/injection/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future initializer() async {
  Bloc.observer = AppBlocObserver();
  await setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppStartupBloc>(
          create: (context) =>
              AppStartupBloc(hiveService: sl<HiveService>())
                ..add(InitializeApp()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(getCurrentUser: sl<GetCurrentUser>()),
        ),
      ],
      child: EmpDesk(),
    ),
  );
}
