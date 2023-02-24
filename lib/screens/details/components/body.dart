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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BackdropAndRating(size: size, movie: movie),
        const SizedBox(height: kDefaultPadding / 2),
        TitleDurationAndFabBtn(movie: movie),
        Genres(movie: movie),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2,
            horizontal: kDefaultPadding
          ),
          child: Text(
            "Plot Summary",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            movie!.plot!,
            style: const TextStyle(color: Color(0xFF737566)), 
          ),
        ),
        CastAndCrew( casts: movie?.cast )
      ],
    );
  }
}

class CastAndCrew extends StatelessWidget {
final List? casts;

  const CastAndCrew({super.key, this.casts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: <Widget>[
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: kDefaultPadding / 2),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
            itemCount: casts!.length,
              itemBuilder: (context, index) => CastCard(cast: casts![index],), 
            ),
          )
        ],
      ),
    );
  }
}

class CastCard extends StatelessWidget {
final Map cast;

  const CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  (cast['image']),
                ),
              )
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            '${cast['originalName']}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}





