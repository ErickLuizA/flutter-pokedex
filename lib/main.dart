import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/search_screen.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/search_viewmodel.dart';
import 'services/web_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => HomeViewModel(WebService()),
              child: HomeScreen(),
            ),
          );
        }

        if (settings.name == '/search') {
          final args = settings.arguments as Map;

          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => SearchViewModel(WebService()),
              child: SearchScreen(
                name: args['name'],
              ),
            ),
          );
        }

        if (settings.name == '/details') {
          final args = settings.arguments as Map;

          return MaterialPageRoute(
            builder: (context) => DetailsScreen(
              pokemon: args['pokemon'],
            ),
          );
        }
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
