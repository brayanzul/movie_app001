import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/movie.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 40% of our total height
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(movie!.backdrop!)
              )
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 50,
                    color: const Color(0xFF12153D).withOpacity(0.2)
                  ),
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30,
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "${movie!.rating!}/",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              )
                            ),
                            const TextSpan(text: "10\n"),
                            const TextSpan(
                              text: "150,212",
                              style: TextStyle(color: kTextLightColor),
                            )
                          ]
                        )
                      )
                    ],
                  ),
                  // Rate this
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.star_border,
                        size: 30,
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(
                        "Rate This",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  // Metascore
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF51CF66),
                          borderRadius: BorderRadius.circular(2)
                        ),
                        child: Text(
                          "${movie!.metascoreRating!}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      const Text(
                        "Metascore",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text(
                        "62 critic review",
                        style: TextStyle(color: kTextLightColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Back Button
          const SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
