import 'package:data/data.dart';

abstract class SettingsRemoteDataSource {
  Future<String> changeAvatar(File imageFile);
}
