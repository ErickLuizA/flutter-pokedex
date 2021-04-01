import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/components/list_item.dart';
import 'package:pokedex/viewmodels/search_viewmodel.dart';

class SearchScreen extends StatefulWidget {
  final String name;

  const SearchScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();

    Provider.of<SearchViewModel>(
      context,
      listen: false,
    ).getPokemon(widget.name);
  }

  @override
  void dispose() {
    super.dispose();

    _textEditingController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 20,
            left: 20,
            top: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                onSubmitted: (value) {
                  final name = value.toLowerCase();

                  viewModel.getPokemon(name);
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
              Consumer<SearchViewModel>(
                builder: (context, searchViewModel, _) {
                  final state = searchViewModel.resource.state;

                  if (state == UIState.Error) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Column(
                            children: [
                              Text("Error while trying to load pokemon"),
                              ElevatedButton(
                                child: Text("Try again"),
                                onPressed: () {
                                  viewModel.setLoading();

                                  Future.delayed(Duration(milliseconds: 200),
                                      () {
                                    viewModel.getPokemon(widget.name);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  if (state == UIState.Success) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ListItem(searchViewModel.resource.pokemon!),
                    );
                  }

                  return SingleChildScrollView(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
