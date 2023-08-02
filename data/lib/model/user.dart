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

  const UserModel({
    required this.fullName,
    required this.bio,
    required this.uid,
    required this.emailIsVerified,
    required this.image,
    required this.email,
    required this.username,
  });

  const UserModel.empty()
      : this(
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

  Map<String, dynamic> toJson(UserModel model) {
    return _$UserModelToJson(model);
  }

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
