import 'package:data/model/user.dart';
import 'package:domain/domain.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel user) {
    return UserEntity(
      password: user.password,
      email: user.email,
      emailIsVerified: user.emailIsVerified,
      image: user.image,
      username: user.username,
      id: user.id,
    );
  }

  static UserModel toModel(UserEntity user) {
    return UserModel(
      email: user.email,
      image: user.image,
      username: user.username,
      emailIsVerified: user.emailIsVerified,
      id: user.id,
    );
  }
}
