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
          Text(
            "Base Stats",
            style: TextStyle(
              color: ColorBasedOnType()
                  .colorBasedOnType(pokemon.types[0]['type']['name']),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
