import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/home/home.dart';
import 'package:spotify_clone/screens/home/widget/appbar.dart';
import 'package:spotify_clone/screens/home/widget/recent.dart';


class SavanHome extends StatelessWidget {
  const SavanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 36, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            RecentItems(),
            HomeScreen()
          ],
        ),
      ),
    );
  }
}
