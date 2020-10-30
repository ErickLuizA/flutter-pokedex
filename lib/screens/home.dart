import 'package:flutter/material.dart';
import 'package:pokedex/components/list_item.dart';
import 'package:pokedex/view_models/pokemon_list_view_model.dart';
import 'package:pokedex/components/app_bar_actions.dart';
import 'package:provider/provider.dart';
import '../components/pokemon_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Provider.of<PokemonListViewModel>(context, listen: false).getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<PokemonListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          AppBarActions(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pokédex",
              style: TextStyle(
                color: Color(0xFF17171B),
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                "Search for Pokémon by name.",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 30,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: myController,
                    onSubmitted: (value) {
                      final name = value.toLowerCase();

                      if (value.isNotEmpty) {
                        viewModel.getPokemon(name);
                        myController.clear();
                      } else {
                        viewModel.clearSearched();
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      labelText: 'What Pokémon are you looking for?',
                    ),
                  )
                ],
              ),
            ),
            viewModel.searchedPokemon != null
                ? ListItem(viewModel.searchedPokemon)
                : Expanded(
                    child: PokemonList(viewModel.pokemonList),
                  ),
          ],
        ),
      ),
    );
  }
}
