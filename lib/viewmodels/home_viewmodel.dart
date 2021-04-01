import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/services/web_service.dart';

enum UIState { Success, Loading, Error, Empty }

class Resource {
  UIState state;
  List<Pokemon> pokemonList;

  bool limitReached;
  bool filtered;
  bool paginationLoading;

  Resource({
    required this.state,
    required this.pokemonList,
    required this.filtered,
    required this.limitReached,
    required this.paginationLoading,
  });
}

class HomeViewModel extends ChangeNotifier {
  WebService _webService;

  HomeViewModel(this._webService);

  Resource resource = Resource(
    state: UIState.Loading,
    pokemonList: [],
    filtered: false,
    limitReached: false,
    paginationLoading: false,
  );

  List<Pokemon> _originalList = [];

  void setLoading() {
    resource.state = UIState.Loading;

    notifyListeners();
  }

  Future<void> getPokemonList({offset = 0}) async {
    if (offset != 0) {
      resource.paginationLoading = true;
    }

    if (offset >= 1045) {
      resource.limitReached = true;

      resource.paginationLoading = false;

      notifyListeners();

      return;
    }

    try {
      List<PokemonList> pokemons = await _webService.getPokemonList(offset);

      List<Pokemon> list = await Future.wait(
        pokemons
            .map((e) async => await _webService.getPokemon(e.name))
            .toList(),
      );

      if (resource.pokemonList.isNotEmpty) {
        resource.pokemonList.addAll(list);

        resource.paginationLoading = false;
      } else {
        resource.pokemonList = list;
      }

      if (resource.pokemonList.isEmpty) {
        resource.state = UIState.Empty;
      }

      resource.state = UIState.Success;
    } catch (e) {
      resource.state = UIState.Error;
    }

    notifyListeners();
  }

  void sortAZ() {
    resource.pokemonList.sort(
      (a, b) => a.name.compareTo(b.name),
    );

    notifyListeners();
  }

  void sortZA() {
    resource.pokemonList.sort(
      (a, b) => b.name.compareTo(a.name),
    );

    notifyListeners();
  }

  void filterByType(String type) {
    resource.filtered = true;

    if (_originalList.isEmpty) {
      _originalList = resource.pokemonList;
    }

    final List<Pokemon> newList = [];

    resource.pokemonList.forEach((element) {
      if (element.types[0]['type']['name'] == type) {
        newList.add(element);
      }
    });

    resource.pokemonList = newList;

    notifyListeners();
  }

  void getOriginal() {
    if (_originalList.isNotEmpty) {
      resource.pokemonList = _originalList;

      resource.filtered = false;

      _originalList = [];

      notifyListeners();
    }
  }
}
