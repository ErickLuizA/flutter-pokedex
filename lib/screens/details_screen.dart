import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';
import 'package:pokedex/components/details_about.dart';
import 'package:pokedex/components/details_evolution.dart';
import 'package:pokedex/components/details_header.dart';
import 'package:pokedex/components/details_stats.dart';

class DetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorBasedOnType()
            .backgroundColorBasedOnType(pokemon.types[0]['type']['name']),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorBasedOnType()
              .backgroundColorBasedOnType(pokemon.types[0]['type']['name']),
        ),
        child: DetailsHeader(pokemon),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.72,
        color: ColorBasedOnType()
            .backgroundColorBasedOnType(pokemon.types[0]['type']['name']),
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                indicatorColor: ColorBasedOnType().backgroundColorBasedOnType(
                    pokemon.types[0]['type']['name']),
                tabs: [
                  Tab(text: 'About'),
                  Tab(text: 'Stats'),
                  Tab(text: 'Evolution'),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: TabBarView(
                    children: [
                      DetailsAbout(pokemon),
                      DetailsStats(pokemon),
                      DetailsEvolution(pokemon),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
