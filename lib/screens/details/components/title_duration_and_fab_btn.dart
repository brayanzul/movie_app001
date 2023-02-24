import 'package:flutter/material.dart';
import 'package:movie_app001/models/movie.dart';

import '../../../constants.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${movie!.title}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      "${movie!.year}",
                      style: const TextStyle(color: kTextLightColor),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    const Text(
                      "PG-13",
                      style: TextStyle(color: kTextLightColor),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    const Text(
                      "2h 32min",
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ],
                )
              ]
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: kSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ), 
            ),
          ),
        ],
      ),
    );
  }
}
