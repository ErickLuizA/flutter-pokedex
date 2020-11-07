import 'package:flutter/material.dart';

class ColorBasedOnType {
  Color colorBasedOnType(String type) {
    Color finalColor;

    switch (type) {
      case 'grass':
        finalColor = Color(0xFF62B957);
        break;
      case 'dark':
        finalColor = Color(0xFF58575F);
        break;
      case 'poison':
        finalColor = Color(0xFFA552CC);
        break;
      case 'dragon':
        finalColor = Color(0xFF0F8ACD);
        break;
      case 'fire':
        finalColor = Color(0xFFFD7D24);
        break;
      case 'psychic':
        finalColor = Color(0xFFEA5D60);
        break;
      case 'water':
        finalColor = Color(0xFF4990DA);
        break;
      case 'flying':
        finalColor = Color(0xFF748FC9);
        break;
      case 'ghost':
        finalColor = Color(0xFF556AAE);
        break;
      case 'bug':
        finalColor = Color(0xFF9CB230);
        break;
      case 'normal':
        finalColor = Color(0xFF9DA0AA);
        break;
      case 'electric':
        finalColor = Color(0xFFEED535);
        break;
      case 'ice':
        finalColor = Color(0xFF61CEC0);
        break;
      case 'ground':
        finalColor = Color(0xFFDD7748);
        break;
      case 'fairy':
        finalColor = Color(0xFFED6EC7);
        break;
      case 'fighting':
        finalColor = Color(0xFFD04164);
        break;
      case 'rock':
        finalColor = Color(0xFFBAAB82);
        break;
      case 'steel':
        finalColor = Color(0xFF417D9A);
        break;
      default:
        finalColor = Color(0xFF);
    }

    return finalColor;
  }

  Color backgroundColorBasedOnType(String type) {
    Color finalColor;

    switch (type) {
      case 'grass':
        finalColor = Color(0xFF8BBE8A);
        break;
      case 'dark':
        finalColor = Color(0xFF6F6E78);
        break;
      case 'poison':
        finalColor = Color(0xFF9F6E97);
        break;
      case 'dragon':
        finalColor = Color(0xFF7383B9);
        break;
      case 'fire':
        finalColor = Color(0xFFFFA756);
        break;
      case 'psychic':
        finalColor = Color(0xFFFF6568);
        break;
      case 'water':
        finalColor = Color(0xFF58ABF6);
        break;
      case 'flying':
        finalColor = Color(0xFF83A2E3);
        break;
      case 'ghost':
        finalColor = Color(0xFF8571BE);
        break;
      case 'bug':
        finalColor = Color(0xFF8BD674);
        break;
      case 'normal':
        finalColor = Color(0xFFB5B9C4);
        break;
      case 'electric':
        finalColor = Color(0xFFF2CB55);
        break;
      case 'ice':
        finalColor = Color(0xFF91D8DF);
        break;
      case 'ground':
        finalColor = Color(0xFFF78551);
        break;
      case 'fairy':
        finalColor = Color(0xFFEBA8C3);
        break;
      case 'fighting':
        finalColor = Color(0xFFEB4971);
        break;
      case 'rock':
        finalColor = Color(0xFFD4C294);
        break;
      case 'steel':
        finalColor = Color(0xFF4C91B2);
        break;
      default:
        finalColor = Color(0xFF);
    }

    return finalColor;
  }
}
