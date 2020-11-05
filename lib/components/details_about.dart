import 'package:flutter/material.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class DetailsAbout extends StatelessWidget {
  final PokemonViewModel pokemon;

  DetailsAbout(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pokédex Data",
            style: TextStyle(
              color: ColorBasedOnType()
                  .colorBasedOnType(pokemon.types[0]['type']['name']),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Height",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text("${pokemon.height}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weight",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text("${pokemon.weight}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Abilities",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    for (var ability in pokemon.abilities)
                      Text(
                        "${ability['ability']['name'][0].toUpperCase()}${ability['ability']['name'].substring(1)}",
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
