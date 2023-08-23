import 'package:amazon_prime/app.dart';
import 'package:data/data.dart';

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
  await getIt<LocaleDataSource>().initBox();
  await getIt<UserLocale>().initBox();
}
