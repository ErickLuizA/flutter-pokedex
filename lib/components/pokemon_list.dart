import 'package:flutter/material.dart';
import '../components//list_item.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class PokemonList extends StatelessWidget {
  final List<PokemonViewModel> pokemonList;

  PokemonList(this.pokemonList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.pokemonList.length,
      itemBuilder: (context, index) {
        final pokemon = this.pokemonList[index];

        return ListItem(pokemon);
      },
    );
  }
}
