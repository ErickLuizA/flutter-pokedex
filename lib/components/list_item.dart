import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/colorBasedOnType.dart';

class ListItem extends StatelessWidget {
  final Pokemon pokemon;

  ListItem(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          10,
        ),
        child: ListTile(
          onTap: () => Navigator.pushNamed(
            context,
            '/details',
            arguments: {
              "pokemon": pokemon,
            },
          ),
          tileColor: ColorBasedOnType()
              .backgroundColorBasedOnType(pokemon.types[0]['type']['name']),
          title: Text(
            "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 20,
            ),
            child: Row(
              children: [
                for (var i = 0; i < pokemon.types.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Container(
                      color: ColorBasedOnType()
                          .colorBasedOnType(pokemon.types[i]['type']['name']),
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
            ),
          ),
          trailing: Image.network(
            pokemon.image,
            width: MediaQuery.of(context).size.width * 0.20,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
