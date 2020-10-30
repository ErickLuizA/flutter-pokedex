import 'package:flutter/material.dart';
import 'package:pokedex/view_models/pokemon_list_view_model.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'screens/pokemon_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      initialRoute: '/home',
      routes: {
        '/home': (context) => ChangeNotifierProvider(
              create: (context) => PokemonListViewModel(),
              child: Home(),
            ),
        '/details': (context) => PokemonDetails(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white24,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color(0xFF747476), fontSize: 16),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
