import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/viewmodels/home_viewmodel.dart';
import 'package:pokedex/components//list_item.dart';

class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemonList;

  PokemonList(this.pokemonList);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    return ListView.builder(
      itemCount: this.pokemonList.length,
      itemBuilder: (context, index) {
        if (index == this.pokemonList.length - 1 &&
            !viewModel.resource.limitReached &&
            !viewModel.resource.filtered) {
          viewModel.getPokemonList(offset: this.pokemonList.length + 1);
        }

        final pokemon = this.pokemonList[index];

        return Column(
          children: [
            ListItem(pokemon),
            if (viewModel.resource.paginationLoading)
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
