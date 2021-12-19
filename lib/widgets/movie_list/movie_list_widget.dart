import 'package:flutter/material.dart';
import 'package:untitled/networking/movie.dart';
import 'package:untitled/networking/networking.dart';
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
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
 Future<MoviesList>? moviesList;
//   final _movie = [
//     Movie(
//         movieImage: Images.venom,
//         movieTitle: 'Venom: Let There Be Carnage',
//         movieDate: 'September 30, 2021',
//         movieDescription:
//             'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
//     Movie(
//         movieImage: Images.venom,
//         movieTitle: 'Red Notice',
//         movieDate: 'September 30, 2021',
//         movieDescription:
//             'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
//     Movie(
//         movieImage: Images.venom,
//         movieTitle: 'The Last Duel',
//         movieDate: 'September 30, 2021',
//         movieDescription:
//             'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
//     Movie(
//         movieImage: Images.venom,
//         movieTitle: 'Shang-Chi and the Legend of the Ten Rings',
//         movieDate: 'September 30, 2021',
//         movieDescription:
//             'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
//     Movie(
//         movieImage: Images.venom,
//         movieTitle: 'Encanto',
//         movieDate: 'September 30, 2021',
//         movieDescription:
//             'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.'),
//   ];

  void _onMovieTap(int index) {
    Navigator.of(context).pushNamed('/main_screen/movie_details');
  }

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  // void _searchMovies() {
  //   final query = _searchController.text;
  //   if (query.isNotEmpty) {
  //     _filteredMovies = _movie.where((Movie movie) {
  //       return movie.movieTitle.contains(query);
  //     }).toList();
  //   } else {
  //     _filteredMovies = _movie;
  //   }
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    loadData();
    // _searchMovies();
    // _searchController.addListener((_searchMovies));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesList>(
        future: moviesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsetsDirectional.only(top: 70.0),
              itemExtent: 150,
              itemCount: snapshot.data!.movies.length,
              itemBuilder: (context, index) {
                // final movie = _filteredMovies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 26.0),
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
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                                '${snapshot.data!.movies[index].posterPath}'),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${snapshot.data!.movies[index].description}',
                                        style: TextStyle(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    Text('${snapshot.data!.movies[index].name}',
                                        style: const TextStyle(
                                            fontSize: 14.4,
                                            color: Colors.grey)),
                                    const SizedBox(height: 24.0),
                                    Text(
                                        '${snapshot.data!.movies[index].description}',
                                        style: const TextStyle(fontSize: 14.4),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          onTap: () => _onMovieTap(index),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasData) {
            return Text('Error');
          }
         return Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withAlpha(235),
                  labelText: 'Search',
                  border: const OutlineInputBorder()),
            ),
          );
  });
  }
}
