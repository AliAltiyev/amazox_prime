import 'package:data/data.dart';

import 'app.dart';

export 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<ProductModel>(LocaleStorage.products.name);
  await Hive.openBox<ProductModel>(LocaleStorage.cart.name);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initAppModule();
  initDataLayer();
  initNavigation();
  initSettingsBloc();
  runApp(Application());
}
