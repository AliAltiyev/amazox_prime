import 'package:core/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/screen/home.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const HomeScreen());
  }
}
