part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersLoaded extends UsersState {
  final List<int> usersByDate;
  final List<UserEntity> users;
  UsersLoaded({
    required this.usersByDate,
    required this.users,
  });
}

final class UsersFailed extends UsersState {}
