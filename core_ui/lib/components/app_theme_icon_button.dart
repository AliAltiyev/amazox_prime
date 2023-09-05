import 'package:core_ui/core_ui.dart';

class AppThemeIcon extends StatelessWidget {
  final VoidCallback _onTap;
  final bool _themeState;

  const AppThemeIcon({
    required VoidCallback onTap,
    required bool themeState,
    super.key,
  })  : _onTap = onTap,
        _themeState = themeState;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return IconButton(
      onPressed: _onTap,
      icon: _themeState
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
                color: ApplicationColors.white,
                height: size.height / Dimensions.SIZE_20,
                width: size.width / Dimensions.SIZE_14,
                ImagePaths.dayIcon,
              ),
            ),
    );
  }
}
