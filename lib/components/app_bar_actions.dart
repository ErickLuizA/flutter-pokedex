import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';
import 'package:pokedex/view_models/pokemon_list_view_model.dart';
import 'package:provider/provider.dart';

class AppBarActions extends StatelessWidget {
  final assets = [
    'bug',
    'dark',
    'dragon',
    'electric',
    'fairy',
    'fighting',
    'fire',
    'flying',
    'ghost',
    'grass',
    'ground',
    'ice',
    'normal',
    'poison',
    'psychic',
    'rock',
    'steel',
    'water',
  ];

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<PokemonListViewModel>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/generation.svg'),
            onPressed: null,
          ),
          IconButton(
              icon: SvgPicture.asset('assets/icons/sort.svg'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          right: 30,
                          left: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sort",
                              style: TextStyle(
                                color: Color(0xFF17171B),
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text("Sort Pokémons alphabetically!"),
                            ),
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                color: Colors.grey[300],
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                elevation: 0,
                                highlightColor: Colors.red,
                                onPressed: () => viewModel.sortAZ(),
                                child: Text("A-Z"),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                color: Colors.grey[300],
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                elevation: 0,
                                highlightColor: Colors.red,
                                onPressed: () => viewModel.sortZA(),
                                child: Text("Z-A"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          IconButton(
            icon: SvgPicture.asset('assets/icons/filter.svg'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: 30,
                        left: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Filters",
                            style: TextStyle(
                              color: Color(0xFF17171B),
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text(
                                "Use advanced search to explore Pokémon by type"),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            child: ListView.builder(
                              itemCount: assets.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(
                                  right: 20,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    viewModel.filterByType(assets[index]);
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: SvgPicture.asset(
                                      'assets/types/${assets[index]}.svg',
                                      color: ColorBasedOnType()
                                          .colorBasedOnType(assets[index]),
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
