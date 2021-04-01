import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_list.dart';

class WebService {
  Future<List<PokemonList>> getPokemonList(offset) async {
    final url = Uri.https('pokeapi.co', '/api/v2/pokemon', {
      "offset": "$offset",
      "limit": "20",
    });

    try {
      final response = await http.get(url);

      final data = jsonDecode(response.body);

      final Iterable list = data['results'];

      return list.map((item) => PokemonList.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Pokemon> getPokemon(String name) async {
    final url = Uri.https('pokeapi.co', '/api/v2/pokemon/$name');

    try {
      final response = await http.get(url);

      final data = jsonDecode(response.body);

      return Pokemon.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
