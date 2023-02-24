import 'package:flutter/material.dart';
import 'package:movie_app001/models/movie.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie? movie;

  const DetailsScreen({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
