part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => <Object>[];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object> get props => <Object>[];
}

class AuthError extends AuthState {
  const AuthError({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class SignedInState extends AuthState {
  const SignedInState({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => <Object>[
        user,
      ];
}

class SignedUpState extends AuthState {
  const SignedUpState();
}

class ForgotPasswordSent extends AuthState {
  const ForgotPasswordSent();
}

class UserUpdated extends AuthState {
  const UserUpdated();
}
