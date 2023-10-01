import 'dart:io';

abstract class UserAvatarRepository {
  Future<String> changeUserAvatar({
    required File imageFile,
  });
}
