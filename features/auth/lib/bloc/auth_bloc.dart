import 'package:auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final AppRouter _autoRouter;

  AuthBloc({
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required AppRouter autoRouter,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _forgotPasswordUseCase = forgotPasswordUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _autoRouter = autoRouter,
        super(const AuthInitialState()) {
    on<AuthEvent>((AuthEvent event, Emitter<AuthState> emit) {
      emit(const AuthLoadingState());
    });
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<ForgotPasswordEvent>(_onForgotPassword);
    on<NavigateToRegistrationPageEvent>(_onNavigateToRegistration);
    on<NavigateTosSignInPageEvent>(_onNavigateToSignIn);
    on<NavigateTosHomePageEvent>(_onNavigateToHome);
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<SignInAsAdminEvent>(_onSignInAsAdmin);
  }

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final Either<Failure, UserEntity> result = await _signInUseCase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (Failure failure) => emit(
        AuthError(
          message: '${failure.statusCode}: ${failure.message}',
        ),
      ),
      (UserEntity user) => emit(SignedInState(user: user)),
    );
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final Either<Failure, void> result = await _signUpUseCase(
      SignUpParams(
        email: event.email,
        password: event.password,
        fullName: event.name,
      ),
    );
    result.fold(
      (Failure failure) => emit(
        AuthError(
          message: '${failure.statusCode}: ${failure.message}',
        ),
      ),
      (_) => emit(const SignedUpState()),
    );
  }

  Future<void> _onForgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final Either<Failure, void> result =
        await _forgotPasswordUseCase(event.email);
    result.fold<void>(
      (Failure failure) =>
          emit(AuthError(message: '${failure.statusCode}: ${failure.message}')),
      (_) => emit(const ForgotPasswordSent()),
    );
  }

  Future<void> _onNavigateToRegistration(
    NavigateToRegistrationPageEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _autoRouter.push<Object?>(const SignUpPage());
  }

  Future<void> _onNavigateToSignIn(
    NavigateTosSignInPageEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthInitialState());
    _autoRouter.replace<Object?>(const SignInPage());
  }

  Future<void> _onNavigateToHome(
    NavigateTosHomePageEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _autoRouter.pushAndPopUntil(
      DashBoardPage(isAdminPanel: false),
      predicate: (Route route) => true,
    );
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    final Either<Failure, UserEntity> result =
        await _signInWithGoogleUseCase(const SignInWithGoogleParams());
    result.fold<void>(
      (Failure failure) => emit(
        AuthError(message: '${failure.statusCode}: ${failure.message}'),
      ),
      (UserEntity user) => emit(SignedInState(user: user)),
    );
  }

  Future<void> _onSignInAsAdmin(
    SignInAsAdminEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _autoRouter.push(const AdminDashboard());
  }
}
