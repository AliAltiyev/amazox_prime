import 'package:domain/domain.dart';

final class UserEntity extends Equatable {
  final String username;
  final String email;
  final String? id;
  final bool emailIsVerified;
  final String image;

  const UserEntity({
    this.emailIsVerified = true,
    this.image = '',
    this.email = '',
    this.username = '',
    this.id,
  });

  @override
  List<Object?> get props => [
        username,
        image,
        email,
        emailIsVerified,
        id,
      ];
}
