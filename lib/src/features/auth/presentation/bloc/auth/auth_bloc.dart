import 'package:empdesk/src/features/auth/domain/usecases/get_current_user.dart';
import 'package:empdesk/src/features/auth/presentation/bloc/auth/auth_event.dart';
import 'package:empdesk/src/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser getCurrentUser;

  AuthBloc({required this.getCurrentUser}) : super(AuthInitial()) {
    on<CheckAuthStatus>(onCheckAuthStatus);
  }

  Future onLogout(LogoutRequested event, emit) async {
    emit(Unauthenticated());
  }

  Future onCheckAuthStatus(CheckAuthStatus event, emit) async {
    emit(AuthLoading());

    final result = await getCurrentUser();

    result.fold((failure) => emit(Unauthenticated()), (user) {
      return user != null
          ? emit(Authenticated(user: user))
          : emit(Unauthenticated());
    });
  }
}
