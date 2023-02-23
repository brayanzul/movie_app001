import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../../../constants.dart';
import '../../../models/movie.dart';
import 'movie_card.dart';

class MovieCarouselState extends StatefulWidget {
  const MovieCarouselState({super.key});

  @override
  State<MovieCarouselState> createState() => _MovieCarouselStateState();
}

class _MovieCarouselStateState extends State<MovieCarouselState> {
  PageController? _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion show on left and right side
      viewportFraction: 0.8,
      // by default pur movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dipose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding
      ),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: const ClampingScrollPhysics(),
          itemCount: movies?.length, // we have 3 demo movies
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) => 
  AnimatedBuilder(
    animation: _pageController!, 
    builder: (context, child) {
      double value = 0;
      if (_pageController!.position.haveDimensions) {
        value = index - _pageController!.page!;
        // we use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
        // we use clamp so that our value very from -1 to 1
        value = (value * 0.038).clamp(-1, 1);
      }
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 350),
        opacity: initialPage == index ? 1 :0.4,
        child: Transform.rotate(
          angle: math.pi * value,
          child: MovieCard(
            movie: movies?[index]),
        ),
      );
    }
  );
}
