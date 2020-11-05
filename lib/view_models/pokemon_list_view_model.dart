import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/services/web_service.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class PokemonListViewModel extends ChangeNotifier {
  List<PokemonViewModel> pokemonList = List<PokemonViewModel>();
  PokemonViewModel searchedPokemon;

  Future<void> getPokemonList() async {
    List<PokemonList> pokemons = await WebService().getPokemonList();

    List list =
        await Future.wait(pokemons.map((e) => WebService().getPokemon(e.name)));

    this.pokemonList = list.map((e) => PokemonViewModel(pokemon: e)).toList();

    notifyListeners();
  }

  Future<void> getPokemon(String name) async {
    Pokemon pokemon = await WebService().getPokemon(name);
    this.searchedPokemon = PokemonViewModel(pokemon: pokemon);

    notifyListeners();
  }

  void clearSearched() {
    this.searchedPokemon = null;

    notifyListeners();
  }
}
