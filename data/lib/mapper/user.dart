import 'package:data/model/user.dart';
import 'package:domain/domain.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel user) {
    return UserEntity(
      bio: user.bio,
      fullName: user.fullName,
      uid: user.uid,
      email: user.email,
      emailIsVerified: user.emailIsVerified,
      image: user.image,
      username: user.username,
    );
  }

  static UserModel toModel(UserEntity user) {
    return UserModel(
        email: user.email,
        image: user.image,
        username: user.username,
        emailIsVerified: user.emailIsVerified,
        uid: user.uid,
        bio: user.bio,
        fullName: user.fullName);
  }
}
