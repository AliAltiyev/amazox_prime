import 'package:settings/settings.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return StreamBuilder<UserEntity>(
            stream: state.currentUser,
            builder: (context, snapshot) {
              return CircleAvatar(
                backgroundColor: ApplicationColors.primaryButtonColor,
                maxRadius: Dimensions.SIZE_88,
                child: Padding(
                  padding: const EdgeInsets.all(
                    ApplicationPadding.PADDING_4,
                  ),
                  child: snapshot.data?.image == null
                      ? const CircleAvatar(
                          foregroundImage: AssetImage(ImagePaths.user),
                          maxRadius: Dimensions.SIZE_88,
                        )
                      : CircleAvatar(
                          foregroundImage: NetworkImage(
                            snapshot.data?.image ?? StringConstant.emptyString,
                          ),
                          maxRadius: Dimensions.SIZE_88,
                        ),
                ),
              );
            });
      },
    );
  }
}
