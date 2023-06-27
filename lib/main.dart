import 'package:amazon_prime/src/app/cofix.dart';
import 'package:core/di/di.dart';
import 'package:core/di/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initAppModule();
  runApp(const Application());
}
