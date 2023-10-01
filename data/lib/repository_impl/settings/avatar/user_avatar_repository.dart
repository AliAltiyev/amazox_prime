import 'package:data/data.dart';

final class UserAvatarRepositoryImpl implements UserAvatarRepository {
  final SettingsRemoteDataSource settingsRemoteDataSource;

  UserAvatarRepositoryImpl({
    required this.settingsRemoteDataSource,
  });

  @override
  Future<String> changeUserAvatar({
    required File imageFile,
  }) {
    return settingsRemoteDataSource.changeAvatar(imageFile);
  }
}
