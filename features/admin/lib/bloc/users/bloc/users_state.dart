part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<int> usersByDate;
  final List<UserEntity> users;
  final List<int> ordersByDate;
  UsersLoaded({
    required this.ordersByDate,
    required this.usersByDate,
    required this.users,
  });

  UsersLoaded copyWith({
    bool? isShowDailyUserStatics,
    List<int>? usersByDate,
    List<UserEntity>? users,
    List<int>? ordersByDate,
  }) {
    return UsersLoaded(
      ordersByDate: ordersByDate ?? this.ordersByDate,
      usersByDate: usersByDate ?? this.usersByDate,
      users: users ?? this.users,
    );
  }
}

final class UsersFailed extends UsersState {}
