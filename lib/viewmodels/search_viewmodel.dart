import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/web_service.dart';

enum UIState { Success, Loading, Error }

class Resource {
  UIState state;
  Pokemon? pokemon;

  Resource({
    required this.state,
    required this.pokemon,
  });
}

class SearchViewModel extends ChangeNotifier {
  WebService _webService;

  SearchViewModel(this._webService);

  Resource resource = Resource(
    state: UIState.Loading,
    pokemon: null,
  );

  void setLoading() {
    resource.state = UIState.Loading;

    notifyListeners();
  }

  Future<void> getPokemon(String name) async {
    try {
      final result = await _webService.getPokemon(name);

      resource.pokemon = result;

      resource.state = UIState.Success;
    } catch (e) {
      resource.state = UIState.Error;
    }

    notifyListeners();
  }
}
