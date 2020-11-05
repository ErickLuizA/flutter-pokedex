import 'package:flutter/material.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class DetailsEvolution extends StatelessWidget {
  final PokemonViewModel pokemon;

  DetailsEvolution(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Evolution Chart",
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
