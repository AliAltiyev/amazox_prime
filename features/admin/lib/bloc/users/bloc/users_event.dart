part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

final class FetchAllUsersPerDayEvent extends UsersEvent {}

final class CloseBottomSheetEvent extends UsersEvent {}
