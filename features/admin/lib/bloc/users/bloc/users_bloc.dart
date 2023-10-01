import 'package:admin/admin.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final FetchAllUsersPerDayUseCase _fetchAllUsersPerDayUseCase;
  final FetchAllUserByRegistrationDateUseCase
      _fetchAllUsersByRegistrationDateUseCase;
  final AppRouter _appRouter;
  final GetOrdersPerDayUseCase _getOrdersPerDayUseCase;
  bool isShowingDailyUser = false;

  UsersBloc(
      {required FetchAllUsersPerDayUseCase fetchAllUserUseCase,
      required FetchAllUserByRegistrationDateUseCase
          fetchAllUsersByRegistrationDateUseCase,
      required AppRouter appRouter,
      required GetOrdersPerDayUseCase getOrdersPerDayUseCase})
      : _fetchAllUsersPerDayUseCase = fetchAllUserUseCase,
        _fetchAllUsersByRegistrationDateUseCase =
            fetchAllUsersByRegistrationDateUseCase,
        _appRouter = appRouter,
        _getOrdersPerDayUseCase = getOrdersPerDayUseCase,
        super(UsersInitial()) {
    on<FetchAllUsersPerDayEvent>(_onFetchAllUsersPerDay);
    on<CloseBottomSheetEvent>(_onCloseBottomSheet);
    on<ShowDailyUserStaticsPressed>(onDailyUserStaticsPressed);

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
      final List<int> ordersCount = await _getOrdersPerDayUseCase();
      emit(UsersLoaded(
        ordersByDate: ordersCount,
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

  bool changeBarChartState() {
    return isShowingDailyUser = !isShowingDailyUser;
  }

  Future<void> onDailyUserStaticsPressed(
    ShowDailyUserStaticsPressed event,
    Emitter<UsersState> emit,
  ) async {
    changeBarChartState();
  }
}
