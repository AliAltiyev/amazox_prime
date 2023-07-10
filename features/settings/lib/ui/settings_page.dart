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
            const CircleAvatar(
              maxRadius: Dimensions.SIZE_88,
            ),
            SizedBox(
              height: size.height / Dimensions.SIZE_20,
            ),
            //Later will fetch from firebase
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
            _profile(),
            _orders(),
            _notifications(),
            _adresses(),
            _promoCodes(),
            _support(),
            _aboutUs(),
          ],
        ),
      ),
    );
  }

  SettingsListTile _aboutUs() {
    return SettingsListTile(
      title: StringConstant.aboutUs,
      trailing: AppIcons.aboutUs,
      onTap: () {
        //Todo add action
      },
      leading: const Icon(
        Icons.warning_amber_outlined,
      ),
    );
  }

  SettingsListTile _support() {
    return SettingsListTile(
      title: StringConstant.support,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        //Todo add action
      },
      leading: AppIcons.support,
    );
  }

  SettingsListTile _promoCodes() {
    return SettingsListTile(
      title: StringConstant.promoCode,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        //Todo add action
      },
      leading: AppIcons.promoCode,
    );
  }

  SettingsListTile _adresses() {
    return SettingsListTile(
      title: StringConstant.adresses,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        //Todo add action
      },
      leading: AppIcons.address,
    );
  }

  SettingsListTile _orders() {
    return SettingsListTile(
      title: StringConstant.orders,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        //Todo add action
      },
      leading: AppIcons.orders,
    );
  }

  SettingsListTile _notifications() {
    return SettingsListTile(
      title: StringConstant.notification,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        //Todo add action
      },
      leading: AppIcons.notifications,
    );
  }

  SettingsListTile _profile() {
    return SettingsListTile(
      title: StringConstant.profile,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        //Todo add action
      },
      leading: AppIcons.profile,
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
                    horizontal: ApplicationPadding.PADDING_14),
                child: SizedBox(
                  height: size.height / Dimensions.SIZE_20,
                  width: size.width / Dimensions.SIZE_14,
                  child: Image.asset(
                    color: ApplicationColors.white,
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
