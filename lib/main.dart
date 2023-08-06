import 'package:amazon_prime/app.dart';
import 'package:data/data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppModule();
  await initDataLayer();
  initNavigation();
  initSettingsBloc();
  runApp(Application());
}

Future<void> _initHive() async {
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  Hive.registerAdapter<FontSizeModel>(FontSizeModelAdapter());
  await Hive.initFlutter();
}
