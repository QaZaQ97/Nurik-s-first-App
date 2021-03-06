// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<http.Response> getData() async {
  const url = 'https://api.themoviedb.org/3/genre/movie/list?api_key=9f6471cafc8f4717c78f900ad8dffa8f&language=en-US&page=1';
  return await http.get(Uri.parse(url));
}

void loadData() {
  getData().then((response) {
      log("rsdata "+ response.body.toString());
    if(response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}
