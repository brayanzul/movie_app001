import 'package:flutter/material.dart';
import 'package:movie_app001/components/genre_card.dart';
import 'package:movie_app001/constants.dart';
import 'package:movie_app001/models/movie.dart';

class Genres extends StatelessWidget {
  const Genres({super.key, Movie? movie});

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Action",
      "Crime",
      "Comedy",
      "Drama",
      "Horror",
      "Animation"
    ];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => GenreCard(
          genre: genres[index],
        ),
      ),
    );
  }
}
