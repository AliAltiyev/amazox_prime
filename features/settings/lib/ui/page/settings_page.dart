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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const UserAvatar(),
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
                context.read<SettingsBloc>().add(
                      LaunchContactsEvent(),
                    );
              },
              leading: const Icon(
                Icons.warning_amber_outlined,
              ),
            ),
          ],
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
                endIndent: Dimensions.SIZE_170,
                indent: Dimensions.SIZE_170,
              ),
              Text(
                StringConstant.changeTextStyle,
                style: AppFonts.bold14,
              ),
              const Divider(
                color: ApplicationColors.black,
              ),
              BlocBuilder<SettingsBloc, FontSizeState>(
                builder: (context, state) {
                  return Center(
                    child: Slider.adaptive(
                      value: state.fontSize.fontSize,
                      divisions: Dimensions.SIZE_3.toInt(),
                      min: Dimensions.SIZE_0,
                      max: Dimensions.SIZE_2,
                      inactiveColor: ApplicationColors.disabledColor,
                      label: StringConstant.changeTextScale,
                      activeColor: ApplicationColors.primaryButtonColor,
                      onChanged: (double fontSize) {
                        context.read<SettingsBloc>().add(
                              SaveFontSizeEvent(
                                fontSizeEntity:
                                    FontSizeEntity(fontSize: fontSize),
                              ),
                            );
                      },
                    ),
                  );
                },
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
