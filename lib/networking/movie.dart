import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:untitled/model/movie.dart';

class MoviesList {
 final List<Movie> movies;
  MoviesList({required this.movies});

  factory MoviesList.fromJson (Map<String, dynamic> json) {
    
    var moviesJson = json['movies'] as List;

    List<Movie> moviesList = moviesJson.map((i) => Movie.fromJson(i)).toList();

    return MoviesList(
      movies: moviesList,
    );
  }
}

class Movie {
  final String? description;
  // final int/ id;
  final String? name;
  final String? posterPath;
  // final String listType;

  Movie({
    required this.description,
    // required this.id,
    // required this.listType,
    required this.name,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      description: json['description'] as String?,
      // id: json['id'] as int,
      name: json['name'] as String,
      posterPath: json['posterPath'] as String?,
      // listType: json['listType'] as String,
    );
  }
}

Future<Movies> getMovieList() async {
  const url =
      'https://api.themoviedb.org/3/movie/popular?api_key=9f6471cafc8f4717c78f900ad8dffa8f&language=en-US&page=1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {

    log(jsonDecode(response.body).     toString());
  return  Movies.fromJson(json.decode(response.body));
    //  MoviesList .fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
