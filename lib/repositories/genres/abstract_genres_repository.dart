import 'package:refrigerator/repositories/models/genre.dart';

abstract class AbstractGenresRepository {
  Future<List<Genre>> getGenres();
}