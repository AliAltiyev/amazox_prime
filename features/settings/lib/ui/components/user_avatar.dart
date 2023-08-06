import 'package:settings/settings.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: ApplicationColors.primaryButtonColor,
      maxRadius: Dimensions.SIZE_88,
      child: Padding(
        padding: EdgeInsets.all(
          ApplicationPadding.PADDING_4,
        ),
        child: CircleAvatar(
          foregroundImage: AssetImage(
            ImagePaths.user,
          ),
          maxRadius: Dimensions.SIZE_88,
        ),
      ),
    );
  }
}
