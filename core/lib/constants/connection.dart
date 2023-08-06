import 'package:core/extensions/string.dart';

final class ConnectionConstants {
  static const String connectionNotExists = 'Нет подключения к интернету';
  static String connectionExists = StringExtension.orEmpty;
}
