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
  final Timestamp registrationDate;

  const UserEntity(
      {required this.fullName,
      required this.bio,
      required this.uid,
      required this.emailIsVerified,
      required this.image,
      required this.email,
      required this.username,
      required this.registrationDate});

  UserEntity.empty()
      : this(
          registrationDate: Timestamp.now(),
          emailIsVerified: true,
          image: '',
          username: '',
          uid: '',
          email: '',
          fullName: '',
          bio: '',
        );

  @override
  List<Object?> get props => <Object?>[
        username,
        image,
        email,
        emailIsVerified,
        uid,
        fullName,
        bio,
      ];
}
