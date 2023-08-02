import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:education_app_tutorial/core/enums/update_user.dart';
import 'package:education_app_tutorial/src/auth/data/models/user_model.dart';
import 'package:education_app_tutorial/src/auth/domain/usecases/forgot_password.dart';
import 'package:education_app_tutorial/src/auth/domain/usecases/sign_in.dart';
import 'package:education_app_tutorial/src/auth/domain/usecases/sign_up.dart';
import 'package:education_app_tutorial/src/auth/domain/usecases/update_user.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignIn signIn,
    required SignUp signUp,
    required ForgotPassword forgotPassword,
    required UpdateUser updateUser,
  })  : _signIn = signIn,
        _signUp = signUp,
        _forgotPassword = forgotPassword,
        _updateUser = updateUser,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<SignInEvent>(_signInHandler);
    on<SignUpEvent>(_signUpHandler);
    on<ForgotPasswordEvent>(_forgotPasswordHandler);
    on<UpdateUserEvent>(_updateUserHandler);
  }

  final SignIn _signIn;
  final SignUp _signUp;
  final ForgotPassword _forgotPassword;
  final UpdateUser _updateUser;

  Future<void> _signInHandler(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signIn(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) =>
          emit(AuthError(message: '${failure.statusCode}: ${failure.message}')),
      (user) => emit(SignedIn(user: user as LocalUserModel)),
    );
  }

  Future<void> _signUpHandler(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signUp(
      SignUpParams(
        email: event.email,
        password: event.password,
        fullName: event.name,
      ),
    );
    result.fold(
      (failure) =>
          emit(AuthError(message: '${failure.statusCode}: ${failure.message}')),
      (_) => emit(const SignedUp()),
    );
  }

  Future<void> _forgotPasswordHandler(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _forgotPassword(event.email);
    result.fold(
      (failure) =>
          emit(AuthError(message: '${failure.statusCode}: ${failure.message}')),
      (_) => emit(const ForgotPasswordSent()),
    );
  }

  Future<void> _updateUserHandler(
    UpdateUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _updateUser(
      UpdateUserParams(
        action: event.action,
        userData: event.userData,
      ),
    );
    result.fold(
      (failure) =>
          emit(AuthError(message: '${failure.statusCode}: ${failure.message}')),
      (_) => emit(const UserUpdated()),
    );
  }
}
