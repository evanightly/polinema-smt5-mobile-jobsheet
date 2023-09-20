import 'package:flutter/material.dart';
import 'package:popular_movies/pages/movie_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MaterialApp(home: MovieList()));
}
