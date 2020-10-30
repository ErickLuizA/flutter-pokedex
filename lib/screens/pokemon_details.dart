import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class PokemonDetails extends StatefulWidget {
  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context).settings.arguments as Map);
    PokemonViewModel pokemon = args['pokemon'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorBasedOnType()
            .backgroundColorBasedOnType(pokemon.types[0]['type']['name']),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorBasedOnType()
              .backgroundColorBasedOnType(pokemon.types[0]['type']['name']),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    pokemon.image,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.1,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(children: [
                          for (var i = 0; i < pokemon.types.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                color: ColorBasedOnType().colorBasedOnType(
                                    pokemon.types[i]['type']['name']),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5, top: 5, right: 5, left: 5),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: SvgPicture.asset(
                                          'assets/types/${pokemon.types[i]['type']['name']}.svg',
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(pokemon.types[i]['type']['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ])
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.72,
        color: ColorBasedOnType()
            .backgroundColorBasedOnType(pokemon.types[0]['type']['name']),
        child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: ColorBasedOnType().backgroundColorBasedOnType(
                      pokemon.types[0]['type']['name']),
                  tabs: [
                    Tab(text: 'About'),
                    Tab(text: 'Stats'),
                    Tab(text: 'Evolution'),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: TabBarView(children: [
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pokédex Data",
                                style: TextStyle(
                                  color: ColorBasedOnType().colorBasedOnType(
                                      pokemon.types[0]['type']['name']),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Height",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  Text("${pokemon.height}"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Weight",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  Text("${pokemon.weight}"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Abilities",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  Column(
                                    children: [
                                      for (var ability in pokemon.abilities)
                                        Text(
                                            "${ability['ability']['name'][0].toUpperCase()}${ability['ability']['name'].substring(1)}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Base Stats",
                              style: TextStyle(
                                color: ColorBasedOnType().colorBasedOnType(
                                    pokemon.types[0]['type']['name']),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Evolution Chart",
                              style: TextStyle(
                                color: ColorBasedOnType().colorBasedOnType(
                                    pokemon.types[0]['type']['name']),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
