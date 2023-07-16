import 'package:data/data.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  }
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
