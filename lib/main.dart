import 'package:data/data.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initAppModule();
  initDataLayer();
  initNavigation();
  initSettingsBloc();
  runApp(Application());
}

Future<void> _initHive() async {
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  Hive.registerAdapter<FontSizeModel>(FontSizeModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<bool>(LocaleStorage.userAuth.name);
  await Hive.openBox<FontSizeModel>(LocaleStorage.font.name);
  await Hive.openBox<ProductModel>(LocaleStorage.products.name);
  await Hive.openBox<ProductModel>(LocaleStorage.cart.name);
  await Hive.openBox<bool>(LocaleStorage.theme.name);
}
