import 'package:flutter/material.dart';
import 'package:pokedex/view_models/pokemon_list_view_model.dart';
import 'package:provider/provider.dart';
import '../components//list_item.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class PokemonList extends StatelessWidget {
  final List<PokemonViewModel> pokemonList;

  PokemonList(this.pokemonList);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<PokemonListViewModel>(context);

    return ListView.builder(
      itemCount: this.pokemonList.length,
      itemBuilder: (context, index) {
        if (index == this.pokemonList.length - 1 && !viewModel.limitReached) {
          viewModel.getPokemonMoreList(this.pokemonList.length + 1);
        }

        final pokemon = this.pokemonList[index];

        return Column(
          children: [
            ListItem(pokemon),
            if (index == pokemonList.length - 1 &&
                !viewModel.filtered &&
                !viewModel.limitReached)
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
