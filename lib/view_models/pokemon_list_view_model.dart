import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/services/web_service.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class PokemonListViewModel extends ChangeNotifier {
  List<PokemonViewModel> pokemonList = List<PokemonViewModel>();
  PokemonViewModel searchedPokemon;
  List<PokemonViewModel> filteredPokemonList;
  bool getPokemonLoading = true;
  bool getMorePokemonLoading = true;
  bool filtered = false;
  bool limitReached = false;

  Future<void> getPokemonList() async {
    List<PokemonList> pokemons = await WebService().getPokemonList(0);

    List list =
        await Future.wait(pokemons.map((e) => WebService().getPokemon(e.name)));

    this.pokemonList = list.map((e) => PokemonViewModel(pokemon: e)).toList();

    getPokemonLoading = false;

    notifyListeners();
  }

  Future<void> getPokemonMoreList(offset) async {
    if (offset >= 1045) {
      limitReached = true;
      notifyListeners();
      return;
    }

    List<PokemonList> pokemons = await WebService().getPokemonList(offset);

    List list =
        await Future.wait(pokemons.map((e) => WebService().getPokemon(e.name)));

    List<PokemonViewModel> newPokemonsList =
        list.map((e) => PokemonViewModel(pokemon: e)).toList();

    this.pokemonList.addAll(newPokemonsList);

    getMorePokemonLoading = false;

    notifyListeners();
  }

  Future<void> getPokemon(String name) async {
    Pokemon pokemon = await WebService().getPokemon(name);
    this.searchedPokemon = PokemonViewModel(pokemon: pokemon);

    notifyListeners();
  }

  void sortAZ() {
    this.pokemonList.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void sortZA() {
    this.pokemonList.sort((a, b) => b.name.compareTo(a.name));
    notifyListeners();
  }

  void filterByType(String type) {
    this.filteredPokemonList = this
        .pokemonList
        .where((element) => element.types[0]['type']['name'] == type)
        .toList();

    filtered = true;

    notifyListeners();
  }

  void clearSearched() {
    this.searchedPokemon = null;
    this.filteredPokemonList = null;

    notifyListeners();
  }
}
