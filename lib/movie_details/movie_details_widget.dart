// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:untitled/resources/app_images.dart';

class MovieDetailsWidget extends StatefulWidget {
  MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 14, 15, 1),
      appBar: AppBar(title: Text('TMDB')),
      body: Column(
        children: [
          _MoviePosterAndImage(),
          _MovieTitle(),
          _MovieInfo(),
          _MovieDesc(),
          _MovieCast(),
        ],
      ),
    );
  }
}

class _MoviePosterAndImage extends StatelessWidget {
  _MoviePosterAndImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Image.asset(Images.venomPoster),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(24, 14, 15, 1),
                  spreadRadius: 35.0,
                  blurRadius: 40.0,
                  offset: Offset(-50, 0),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                Images.venom,
                width: 120,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  _MovieTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: RichText(
        text: TextSpan(
            text: 'Venom: Let There Be Carnage',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0),
            children: [
              TextSpan(
                text: ' (2021)',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ]),
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  const _MovieInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        '10/01/2021 (US) * 1h 37m \n Science Fiction,Action,Adventure',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}

class _MovieDesc extends StatelessWidget {
  const _MovieDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          Text(
            'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class _MovieCast extends StatelessWidget {
  const _MovieCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  'Kelly Marcel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Screenplay, Story',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ]),
              //SizedBox(width: 20.0),
              Expanded(
                child: Column(
                children: [
                  Text(
                    'Kelly Marcel',
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Screenplay, Story',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ]),
              ),
            ],
          ),
          Row(
            children: [],
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
