import 'package:flutter/material.dart';
import 'package:movie_app001/constants.dart';
import 'package:movie_app001/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        //icon: SvgPicture.asset('assets/icons/menu.svg'),
        icon: const Icon(
          Icons.menu_rounded,
          size: 35,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          icon: const Icon(
            Icons.search,
            size: 35,
            color: Colors.black,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
