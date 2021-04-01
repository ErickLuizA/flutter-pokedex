import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/viewmodels/home_viewmodel.dart';
import 'package:pokedex/components/app_bar_actions.dart';
import 'package:pokedex/components/pokemon_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();

    Provider.of<HomeViewModel>(context, listen: false).getPokemonList();
  }

  @override
  void dispose() {
    super.dispose();

    _textEditingController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: _textEditingController,
                    onSubmitted: (value) {
                      final name = value.toLowerCase();

                      Navigator.of(context).pushNamed(
                        '/search',
                        arguments: {"name": name},
                      );
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
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (context, viewModel, _) {
                  final state = viewModel.resource.state;

                  if (state == UIState.Error) {
                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Text("Error while trying to load list"),
                            ElevatedButton(
                              child: Text("Try again"),
                              onPressed: () async {
                                viewModel.setLoading();

                                Future.delayed(Duration(milliseconds: 200), () {
                                  viewModel.getPokemonList();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (state == UIState.Success) {
                    return PokemonList(viewModel.resource.pokemonList);
                  }

                  if (state == UIState.Empty) {
                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Text("No items found"),
                            ElevatedButton(
                              child: Text("Try again"),
                              onPressed: () async {
                                viewModel.setLoading();

                                Future.delayed(Duration(milliseconds: 200), () {
                                  viewModel.getPokemonList();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
