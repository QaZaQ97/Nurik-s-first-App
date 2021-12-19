import 'package:flutter/material.dart';
import 'package:untitled/movie_details/movie_details_widget.dart';
import 'package:untitled/widgets/auth/auth_widgets.dart';
import 'package:untitled/widgets/main_screen/main_screen_widget.dart';
import 'package:untitled/theme/app_color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SourceSansPro-Black.ttf',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.mainDarkColor,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColor.mainDarkColor),
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) => const MovieDetailsWidget(),
      },
      initialRoute: '/main_screen',
    );
  }
}