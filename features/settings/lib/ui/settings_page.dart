import 'dart:developer';

import 'package:settings/bloc/font_size_bloc.dart';
import 'package:settings/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: _appBarActions(size),
      ),
      body: BlocProvider(
        create: (context) => FontSizeBloc(
          saveFontSizeUsecase: getIt(),
          getFontSizeUsecase: getIt(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const CircleAvatar(
                  backgroundColor: ApplicationColors.primaryButtonColor,
                  maxRadius: Dimensions.SIZE_88,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/images/person.jpg'),
                      maxRadius: Dimensions.SIZE_88,
                    ),
                  )),
              SizedBox(
                height: size.height / Dimensions.SIZE_20,
              ),
              //!Later will fetch from firebase
              Text(
                StringConstant.userName,
                style: AppFonts.bold22,
                textAlign: TextAlign.center,
              ),
              //Later will fetch from firebase
              Text(
                StringConstant.gmail,
                style: AppFonts.normal18,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / Dimensions.SIZE_14,
              ),
              SettingsListTile(
                title: StringConstant.profile,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  //Todo add action
                },
                leading: AppIcons.profile,
              ),
              SettingsListTile(
                title: StringConstant.orders,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  //Todo add action
                },
                leading: AppIcons.orders,
              ),
              SettingsListTile(
                title: StringConstant.notification,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  //Todo add action
                },
                leading: AppIcons.notifications,
              ),
              SettingsListTile(
                title: StringConstant.adresses,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  //Todo add action
                },
                leading: AppIcons.address,
              ),
              SettingsListTile(
                title: StringConstant.promoCode,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  //Todo add action
                },
                leading: AppIcons.promoCode,
              ),
              SettingsListTile(
                title: StringConstant.changeTextStyle,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  _showChangeTextSize(
                    context,
                    size,
                  );
                },
                leading: AppIcons.support,
              ),
              SettingsListTile(
                title: StringConstant.aboutUs,
                trailing: AppIcons.aboutUs,
                onTap: () {
                  //Todo add action
                },
                leading: const Icon(
                  Icons.warning_amber_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PersistentBottomSheetController<dynamic> _showChangeTextSize(
    BuildContext context,
    Size size,
  ) {
    return showBottomSheet(
      context: context,
      clipBehavior: Clip.antiAlias,
      elevation: Dimensions.SIZE_0,
      backgroundColor: ApplicationColors.white,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Dimensions.SIZE_10,
              ),
              topRight: Radius.circular(
                Dimensions.SIZE_10,
              ),
            ),
          ),
          height: size.height / Dimensions.SIZE_2,
          width: size.width,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: Dimensions.SIZE_20,
              ),
              const Divider(
                thickness: Dimensions.SIZE_4,
                color: ApplicationColors.dividerColor,
                endIndent: 170,
                indent: 170,
              ),
              Text(
                StringConstant.changeTextStyle,
                style: AppFonts.bold14,
              ),
              const Divider(
                color: ApplicationColors.black,
              ),
              BlocProvider(
                create: (context) => FontSizeBloc(
                  saveFontSizeUsecase: getIt(),
                  getFontSizeUsecase: getIt(),
                ),
                child: BlocBuilder<FontSizeBloc, FontSizeState>(
                  builder: (context, state) {
                    return Center(
                      child: Slider.adaptive(
                        value: state.fontSize.fontSize,
                        divisions: 4,
                        min: 1,
                        max: 8,
                        inactiveColor: ApplicationColors.disabledColor,
                        label: 'AAAA',
                        activeColor: ApplicationColors.primaryButtonColor,
                        onChanged: (double fontSize) {
                          context.read<FontSizeBloc>().add(
                                SaveFontSizeEvent(
                                  fontSizeEntity:
                                      FontSizeEntity(fontSize: fontSize),
                                ),
                              );
                          log("$fontSize");
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> _appBarActions(Size size) {
    return <Widget>[
      InkWell(
        onTap: () {
          context.read<ThemeCubit>().isDark;
          context.read<ThemeCubit>().changeIcon();
        },
        child: context.watch<ThemeCubit>().iconState
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ApplicationPadding.PADDING_14,
                ),
                child: SizedBox(
                  height: size.height / Dimensions.SIZE_20,
                  width: size.width / Dimensions.SIZE_14,
                  child: Image.asset(
                    color: ApplicationColors.black,
                    ImagePaths.nightIcon,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ApplicationPadding.PADDING_14,
                ),
                child: Image.asset(
                  height: size.height / Dimensions.SIZE_20,
                  width: size.width / Dimensions.SIZE_14,
                  ImagePaths.dayIcon,
                ),
              ),
      )
    ];
  }
}
