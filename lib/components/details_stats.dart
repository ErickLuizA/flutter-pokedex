import 'package:flutter/material.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class DetailsStats extends StatelessWidget {
  final PokemonViewModel pokemon;

  DetailsStats(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              "Base Stats",
              style: TextStyle(
                color: ColorBasedOnType()
                    .colorBasedOnType(pokemon.types[0]['type']['name']),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          for (var stat in pokemon.stats)
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
                top: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stat['stat']['name'][0].toUpperCase() +
                        stat['stat']['name'].substring(1),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(stat['base_stat'].toString()),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
