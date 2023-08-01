import 'package:data/data.dart';

class UserModel extends Equatable {
  final String? id;
  final String username;
  final String email;
  final String image;
  final bool emailIsVerified;

  const UserModel({
    this.image = '',
    this.id,
    this.username = '',
    this.email = '',
    this.emailIsVerified = true,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
        id: snap.id,
        username: snap['username'],
        email: snap['email'],
        image: snap['image'],
        emailIsVerified: snap['emailIsVerified']);
  }

  Map<String, Object> toDocument() {
    return {
      'username': username,
      'email': email,
      'image': image,
      'emailIsVerified': emailIsVerified,
    };
  }

  @override
  List<Object?> get props => [
        image,
        username,
        id,
        email,
      ];

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? image,
    bool? emailIsVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      image: image ?? this.image,
      emailIsVerified: emailIsVerified ?? this.emailIsVerified,
    );
  }
}
