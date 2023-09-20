import 'package:flutter/material.dart';
import 'package:popular_movies/pages/movie_detail.dart';
import 'package:popular_movies/services/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List? movies;

  Future initialize() async {
    movies = [];
    movies = await HttpService.getPopularMovies();
    setState(() {
      moviesCount = movies!.length;
      movies = movies;
    });
  }

  movieDetail(int index) {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (context) => MovieDetail(movies?[index]));
    Navigator.push(context, route);
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: ListView.builder(
        itemCount: moviesCount ?? 0,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              onTap: () => movieDetail(index),
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movies![index].posterPath}'),
              title: Text(movies![index].title!),
              subtitle: Text('Rating = ${movies![index].voteAverage}'),
            ),
          );
        },
      ),
    );
  }
}
