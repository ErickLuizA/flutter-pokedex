import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            onPressed: null,
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/filter.svg'),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
