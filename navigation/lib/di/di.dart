import 'package:navigation/navigation.dart';

void initNavigation() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
