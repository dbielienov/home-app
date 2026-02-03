import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:refrigerator/app.dart';
import 'package:refrigerator/repositories/dio_client.dart';
import 'package:refrigerator/repositories/genres/genres_repository.dart';
import 'package:refrigerator/repositories/genres/abstract_genres_repository.dart';

Future<void> main() async {
  GetIt.I.registerLazySingleton<AbstractGenresRepository>(() => GenresRepository(dio: DioClient.dio));
  await dotenv.load();
  runApp(const App());
}
