import 'package:data/data.dart';

part 'user.g.dart';

@JsonSerializable()
final class UserModel extends Equatable {
  final String email;
  final String uid;
  final String? bio;
  final String fullName;
  final bool? emailIsVerified;
  final String? image;
  final String username;
  final DateTime registrationDate;

  const UserModel({
    required this.registrationDate,
    required this.fullName,
    required this.bio,
    required this.uid,
    required this.emailIsVerified,
    required this.image,
    required this.email,
    required this.username,
  });

  UserModel.empty()
      : this(
          registrationDate: DateTime.now(),
          emailIsVerified: true,
          image: '',
          username: '',
          uid: '',
          email: '',
          fullName: '',
          bio: '',
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  DataMap toMap() => {
        'uid': uid,
        'email': email,
        'fullName': fullName,
        'image': image,
        'bio': bio,
        'username': username,
        'emailIsVerified': emailIsVerified,
        'registrationDate': registrationDate
      };

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
