import 'package:admin/admin.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final FetchAllUsersPerDayUseCase _fetchAllUsersPerDayUseCase;
  final FetchAllUserByRegistrationDateUseCase
      _fetchAllUsersByRegistrationDateUseCase;
  final AppRouter _appRouter;

  UsersBloc({
    required FetchAllUsersPerDayUseCase fetchAllUserUseCase,
    required FetchAllUserByRegistrationDateUseCase
        fetchAllUsersByRegistrationDateUseCase,
    required AppRouter appRouter,
  })  : _fetchAllUsersPerDayUseCase = fetchAllUserUseCase,
        _fetchAllUsersByRegistrationDateUseCase =
            fetchAllUsersByRegistrationDateUseCase,
        _appRouter = appRouter,
        super(UsersInitial()) {
    on<FetchAllUsersPerDayEvent>(_onFetchAllUsersPerDay);
    on<CloseBottomSheetEvent>(_onCloseBottomSheet);
    add(FetchAllUsersPerDayEvent());
  }

  Future<void> _onFetchAllUsersPerDay(
    FetchAllUsersPerDayEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(UsersLoading());

    try {
      final List<int> usersCount = await _fetchAllUsersPerDayUseCase();
      final List<UserEntity> users =
          await _fetchAllUsersByRegistrationDateUseCase();
      emit(UsersLoaded(
        usersByDate: usersCount,
        users: users,
      ));
    } catch (e) {
      emit(UsersFailed());
    }
  }

  Future<void> _onCloseBottomSheet(
    CloseBottomSheetEvent event,
    Emitter<UsersState> emit,
  ) async {
    await _appRouter.pop();
  }
}
