import 'package:flutter/material.dart';
import 'package:refrigerator/router/router.dart';
import 'package:refrigerator/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
