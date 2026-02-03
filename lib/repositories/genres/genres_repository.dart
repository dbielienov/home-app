import 'package:dio/dio.dart';
import 'package:refrigerator/repositories/genres/abstract_genres_repository.dart';
import 'package:refrigerator/repositories/models/genre.dart';

class GenresRepository implements AbstractGenresRepository {
  GenresRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<Genre>> getGenres() async {
    final response = await dio.get('/genre/movie/list?language=en');
    final genresJson = response.data['genres'] as List;

    return genresJson
        .map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
