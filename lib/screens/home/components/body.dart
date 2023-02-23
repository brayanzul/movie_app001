//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_app001/constants.dart';
import 'package:movie_app001/screens/home/components/categories.dart';

import 'genres.dart';

import 'movie_carousel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // it enable scroll on small device
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          Categorylist(),
          Genres(),
          SizedBox(height: kDefaultPadding),
          MovieCarouselState()
        ],
      ),
    );
  }
}




