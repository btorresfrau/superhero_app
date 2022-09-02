import 'package:flutter/material.dart';

import 'screens/screens.dart';
import 'themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superheros',
      theme: CustomTheme.light,
      darkTheme: CustomTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const SuperheroListScreen(),
        '/details':(context) => const SuperheroDetailsScreen()
      },
    );
  }
}