import 'package:amazon_prime/app.dart';
import 'package:data/data.dart';
import 'package:data/model/order.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppModule();
  await initDataLayer();
  initNavigation();
  initSettingsBloc();
  await _initHive();
  runApp(Application());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  Hive.registerAdapter<FontSizeModel>(FontSizeModelAdapter());
  Hive.registerAdapter<UserOrderModel>(UserOrderModelAdapter());
  await getIt<LocaleDataSource>().initBox();
  await getIt<UserLocale>().initBox();
}
