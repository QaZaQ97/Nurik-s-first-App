// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:untitled/resources/app_images.dart';

class Movie {
  final String movieImage;
  final String movieTitle;
  final String movieDate;
  final String movieDescription;

  Movie(
      {required this.movieImage,
      required this.movieTitle,
      required this.movieDate,
      required this.movieDescription});
}

class MovieList extends StatefulWidget {
  MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _movie = [
    Movie(
        movieImage: Images.venom,
        movieTitle: 'Venom: Let There Be Carnage',
        movieDate: 'September 30, 2021',
        movieDescription:
            'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
    Movie(
        movieImage: Images.venom,
        movieTitle: 'Red Notice',
        movieDate: 'September 30, 2021',
        movieDescription:
            'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
    Movie(
        movieImage: Images.venom,
        movieTitle: 'The Last Duel',
        movieDate: 'September 30, 2021',
        movieDescription:
            'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
    Movie(
        movieImage: Images.venom,
        movieTitle: 'Shang-Chi and the Legend of the Ten Rings',
        movieDate: 'September 30, 2021',
        movieDescription:
            'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
    Movie(
        movieImage: Images.venom,
        movieTitle: 'Encanto',
        movieDate: 'September 30, 2021',
        movieDescription:
            'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
  ];

  void _onMovieTap(int index) {
    Navigator.of(context).pushNamed('/main_screen/movie_details');
  }

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movie.where((Movie movie) {
        return movie.movieTitle.contains(query);
      }).toList();
    } else {
      _filteredMovies = _movie;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchMovies();
    _searchController.addListener((_searchMovies));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsetsDirectional.only(top: 70.0),
          itemExtent: 150,
          itemCount: _filteredMovies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 2.0,
                          offset: Offset(1, 1),
                        ),
                      ],
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(movie.movieImage),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(movie.movieTitle,
                                    style: TextStyle(fontSize: 16),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                Text(movie.movieDate,
                                    style: TextStyle(
                                        fontSize: 14.4, color: Colors.grey)),
                                SizedBox(height: 24.0),
                                Text(movie.movieDescription,
                                    style: TextStyle(fontSize: 14.4),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      onTap: () => _onMovieTap(index),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                labelText: 'Search',
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
