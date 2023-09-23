// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      registrationDate: json['registrationDate'] as Timestamp,
      fullName: json['fullName'] as String,
      bio: json['bio'] as String?,
      uid: json['uid'] as String,
      emailIsVerified: json['emailIsVerified'] as bool?,
      image: json['image'] as String?,
      email: json['email'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'bio': instance.bio,
      'fullName': instance.fullName,
      'emailIsVerified': instance.emailIsVerified,
      'image': instance.image,
      'username': instance.username,
      'registrationDate': instance.registrationDate,
    };
