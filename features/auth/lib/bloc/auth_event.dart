part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  const SignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<String> get props => <String>[
        email,
        password,
      ];
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;

  @override
  List<Object?> get props => <Object?>[
        email,
        password,
        name,
      ];
}

class SignInAsAdminEvent extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class ForgotPasswordEvent extends AuthEvent {
  const ForgotPasswordEvent({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => <Object?>[
        email,
      ];
}

final class NavigateToRegistrationPageEvent extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}

final class NavigateTosSignInPageEvent extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}

final class NavigateTosHomePageEvent extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}

final class SignInWithGoogleEvent extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}
