import 'package:data/data.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initAppModule();
  initDataLayer();
  initHome();
  initNavigation();
  initSettings();
  runApp(Application());
}
