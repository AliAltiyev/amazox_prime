import 'package:domain/domain.dart';

@immutable
final class UserEntity extends Equatable {
  final String email;
  final String password;
  final String? id;
  final bool emailIsVerified;
  final String image;
  final String username;

  const UserEntity({
    required this.password,
    required this.emailIsVerified,
    required this.image,
    required this.email,
    required this.username,
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
