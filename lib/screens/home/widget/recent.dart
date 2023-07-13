import 'package:flutter/material.dart';
import 'package:spotify_clone/helpers/const.dart';


class RecentItems extends StatelessWidget {
  const RecentItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 0, right: 0, bottom: 0, top: 20),
      child: SizedBox(
        height: 220,
        child: GridView.builder(
          itemCount: kPlaylistGrid.length,
          gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemBuilder: (ctx, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xff2E2F33),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(kPlaylistGrid[index].img),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      kPlaylistGrid[index].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          overflow: TextOverflow.clip),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
