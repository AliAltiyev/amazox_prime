import 'package:data/data.dart';
import 'package:settings/di/di.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initAppModule();
  initDataLayer();
  initNavigation();
  initSettingsBloc();
  runApp(Application());
}
