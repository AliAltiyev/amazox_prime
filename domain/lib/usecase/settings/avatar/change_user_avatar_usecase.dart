import 'dart:io';

import 'package:domain/domain.dart';

final class ChangeUserAvatarUserCase {
  final UserAvatarRepository userAvatarRepository;

  ChangeUserAvatarUserCase({
    required this.userAvatarRepository,
  });

  Future<dynamic> call({
    required File imageFile,
  }) {
    return userAvatarRepository.changeUserAvatar(imageFile: imageFile);
  }
}
