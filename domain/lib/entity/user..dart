import 'package:domain/domain.dart';

@immutable
final class UserEntity extends Equatable {
  final String email;
  final String uid;
  final String? bio;
  final String fullName;
  final bool? emailIsVerified;
  final String? image;
  final String username;

  const UserEntity({
    required this.fullName,
    required this.bio,
    required this.uid,
    required this.emailIsVerified,
    required this.image,
    required this.email,
    required this.username,
  });

  @override
  List<Object?> get props => [
        username,
        image,
        email,
        emailIsVerified,
        uid,
        fullName,
        bio,
      ];
}
