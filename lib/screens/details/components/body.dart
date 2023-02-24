import 'package:flutter/material.dart';
import 'package:movie_app001/constants.dart';

import '../../../models/movie.dart';
import '../../home/components/genres.dart';
import 'backdrop_rating.dart';
import 'title_duration_and_fab_btn.dart';

class Body extends StatelessWidget {
  final Movie? movie;

  const Body({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        BackdropAndRating(size: size, movie: movie),
        const SizedBox(height: kDefaultPadding / 2),
        TitleDurationAndFabBtn(movie: movie),
        Genres(movie: movie)
      ],
    );
  }
}





