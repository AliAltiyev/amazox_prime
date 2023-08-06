import 'dart:io';

import 'package:auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final AppRouter _autoRouter;

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required AppRouter autoRouter,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _forgotPasswordUseCase = forgotPasswordUseCase,
        _autoRouter = autoRouter,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<SignInEvent>(_signInHandler);
    on<SignUpEvent>(_signUpHandler);
    on<ForgotPasswordEvent>(_forgotPasswordHandler);
    on<NavigateToRegistrationPageEvent>(_navigateToRegistration);
    on<NavigateTosSignInPageEvent>(_navigateToSignIn);
    on<NavigateTosHomePageEvent>(_navigateToHome);
  }

  Future<void> _signInHandler(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signInUseCase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) =>
          emit(AuthError(message: '${failure.statusCode}: ${failure.message}')),
      (user) => emit(SignedIn(user: user)),
    );
  }

  Future<void> _signUpHandler(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signUpUseCase(
      SignUpParams(
        email: event.email,
        password: event.password,
        fullName: event.name,
      ),
    );
    result.fold(
      (failure) => emit(AuthError(
        message: '${failure.statusCode}: ${failure.message}',
      )),
      (_) => emit(const SignedUp()),
    );
  }

  Future<void> _forgotPasswordHandler(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _forgotPasswordUseCase(event.email);
    result.fold(
      (failure) =>
          emit(AuthError(message: '${failure.statusCode}: ${failure.message}')),
      (_) => emit(const ForgotPasswordSent()),
    );
  }

  Future<void> _navigateToRegistration(
    NavigateToRegistrationPageEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _autoRouter.push(const SignUpPage());
  }

  Future<void> _navigateToSignIn(
    NavigateTosSignInPageEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthInitial());
    _autoRouter.replace(const SignInPage());
  }

  Future<void> _navigateToHome(
    NavigateTosHomePageEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _autoRouter.replace(const DashBoardPage());
  }
}
