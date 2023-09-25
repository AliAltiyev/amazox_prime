import 'package:admin/admin.dart';

class AppUsersPage extends StatefulWidget {
  const AppUsersPage({
    super.key,
  });

  @override
  State<AppUsersPage> createState() => _AppUsersPageState();
}

class _AppUsersPageState extends State<AppUsersPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ApplicationColors.pageBackground,
      body: BlocProvider<UsersBloc>(
        create: (BuildContext context) => UsersBloc(
          getOrdersPerDayUseCase: getIt<GetOrdersPerDayUseCase>(),
          appRouter: getIt<AppRouter>(),
          fetchAllUsersByRegistrationDateUseCase:
              getIt<FetchAllUserByRegistrationDateUseCase>(),
          fetchAllUserUseCase: getIt<FetchAllUsersPerDayUseCase>(),
        ),
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (BuildContext context, UsersState state) {
            if (state is UsersLoading) {
              return const CircularProgressIndicator.adaptive();
            } else if (state is UsersLoaded) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: Dimensions.SIZE_50,
                ),
                child: ListView(
                  children: <Widget>[
                    Text(
                      context.watch<UsersBloc>().isShowingDailyUser
                          ? StringConstant.salesStatics
                          : StringConstant.userStatics,
                      style: AppFonts.bold18.apply(
                        color: ApplicationColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.SIZE_10,
                      ),
                      child: SizedBox(
                        height: size.height / Dimensions.SIZE_2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.SIZE_20,
                          ),
                          child: context.watch<UsersBloc>().isShowingDailyUser
                              ? AppBarChart(
                                  users: state.usersByDate,
                                  orders: state.ordersByDate,
                                  isShowSales: context
                                      .watch<UsersBloc>()
                                      .isShowingDailyUser,
                                )
                              : AppBarChart(
                                  users: state.usersByDate,
                                  orders: state.ordersByDate,
                                  isShowSales: context
                                      .watch<UsersBloc>()
                                      .isShowingDailyUser,
                                ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: AdminCart(
                            onTap: () {
                              _showBottomSheet(
                                context,
                                size,
                              );
                            },
                            icon: Icons.supervised_user_circle_rounded,
                            text: StringConstant.usersLabel,
                            height: size.height / Dimensions.SIZE_6,
                            width: size.width / Dimensions.SIZE_5,
                          ),
                        ),
                        Expanded(
                          child: AdminCart(
                            onTap: () {
                              setState(() {});
                              context
                                  .read<UsersBloc>()
                                  .add(ShowDailyUserStaticsPressed());
                            },
                            icon: Icons.monetization_on,
                            text: StringConstant.sales,
                            height: size.height / Dimensions.SIZE_6,
                            width: size.width / Dimensions.SIZE_5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(StringConstants.error),
              );
            }
          },
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Size size) {
    showBottomSheet(
      backgroundColor: ApplicationColors.pageBackground,
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(top: Dimensions.SIZE_50),
          child: BlocProvider<UsersBloc>(
            create: (BuildContext context) => UsersBloc(
              getOrdersPerDayUseCase: getIt<GetOrdersPerDayUseCase>(),
              appRouter: getIt<AppRouter>(),
              fetchAllUsersByRegistrationDateUseCase:
                  getIt<FetchAllUserByRegistrationDateUseCase>(),
              fetchAllUserUseCase: getIt<FetchAllUsersPerDayUseCase>(),
            ),
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (BuildContext context, UsersState state) {
                if (state is UsersFailed) {
                  return const Center(
                    child: Text(StringConstants.error),
                  );
                }
                if (state is UsersLoaded) {
                  return Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          StringConstant.users,
                          style: AppFonts.bold18.apply(
                            color: ApplicationColors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.SIZE_50),
                        child: SizedBox(
                          height: size.height,
                          width: size.width,
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                endIndent: Dimensions.SIZE_8,
                                indent: Dimensions.SIZE_8,
                                color: ApplicationColors.primaryButtonColor,
                              );
                            },
                            shrinkWrap: true,
                            itemCount: state.users.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: Image.asset(ImagePaths.user),
                                    ),
                                    const SizedBox(
                                      width: Dimensions.SIZE_16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${StringConstant.postAddress}: ${state.users[index].email}',
                                          style: AppFonts.bold14.apply(
                                            color: ApplicationColors.white,
                                          ),
                                        ),
                                        Text(
                                          '${StringConstant.registrationDate}: ${DateFormat('dd.MM.yyyy').format(
                                            state.users[index].registrationDate
                                                .toDate(),
                                          )}',
                                          style: AppFonts.bold14.apply(
                                            color: ApplicationColors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        right: Dimensions.SIZE_10,
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<UsersBloc>()
                                .add(CloseBottomSheetEvent());
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            size: Dimensions.SIZE_26,
                            color: ApplicationColors.primaryButtonColor,
                          ),
                        ),
                      )
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        );
      },
    );
  }
}
