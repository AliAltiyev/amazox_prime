import 'package:navigation/navigation.dart';
import 'package:navigation/navigation/app_router.dart';

void initNavigation() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
