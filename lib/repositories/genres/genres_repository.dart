import 'package:refrigerator/repositories/dio_client.dart';
import 'package:refrigerator/repositories/models/genre.dart';

class GenresRepository {
  Future<List<Genre>> getGenres() async {
    final response = await DioClient.dio.get('/genre/movie/list?language=en');
    final genresJson = response.data['genres'] as List;

    return genresJson
        .map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
