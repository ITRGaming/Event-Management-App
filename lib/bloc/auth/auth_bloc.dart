import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
  }
  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {}
  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {}
}
