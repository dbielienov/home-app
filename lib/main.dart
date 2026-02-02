import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:refrigerator/app.dart';

Future<void> main() async {
  await dotenv.load(); // загружает .env до старта приложения
  runApp(const App());
}
