import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:popular_movies/models/movie.dart';

class HttpService {
  static final String? apiKey = dotenv.env['API_KEY'];
  static const String baseUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=';

  static Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey!;
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
