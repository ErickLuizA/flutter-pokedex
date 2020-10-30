import 'package:pokedex/models/pokemon.dart';

class PokemonViewModel {
  final Pokemon pokemon;

  PokemonViewModel({this.pokemon});

  List get forms {
    return this.pokemon.forms;
  }

  List get types {
    return this.pokemon.types;
  }

  List get abilities {
    return this.pokemon.abilities;
  }

  List get stats {
    return this.pokemon.stats;
  }

  Object get species {
    return this.pokemon.species;
  }

  int get experience {
    return this.pokemon.experience;
  }

  int get weight {
    return this.pokemon.weight;
  }

  int get height {
    return this.pokemon.height;
  }

  String get name {
    return this.pokemon.name;
  }

  String get image {
    return this.pokemon.image;
  }
}
