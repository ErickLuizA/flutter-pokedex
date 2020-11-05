import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';
import 'package:pokedex/view_models/pokemon_view_model.dart';

class DetailsHeader extends StatelessWidget {
  final PokemonViewModel pokemon;

  DetailsHeader(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 40,
          ),
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
                  Row(
                    children: [
                      for (var i = 0; i < pokemon.types.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Container(
                            color: ColorBasedOnType().colorBasedOnType(
                                pokemon.types[i]['type']['name']),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                                top: 5,
                                right: 5,
                                left: 5,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/types/${pokemon.types[i]['type']['name']}.svg',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    pokemon.types[i]['type']['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
