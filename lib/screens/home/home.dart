import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify_clone/api/api.dart';
import 'package:spotify_clone/const.dart';
import 'package:spotify_clone/helpers/format.dart';
import 'package:spotify_clone/screens/home/widget/appbar.dart';
import 'package:spotify_clone/screens/home/widget/recent.dart';
import 'package:spotify_clone/screens/home/widget/section_builder.dart';

bool fetched = false;
List lists = ['recent', 'playlist', ...?data['collections'] as List?];
Map data = {};
List playlistNames = [];

extension GetByKeyIndex on Map {
  elementAt(int index) => values.elementAt(index);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  int recentIndex = 0;
  int playlistIndex = 1;
  Future<void> getHomePageData() async {
    Map recievedData = await SaavnAPI().fetchHomePageData();
    getPrettyJSONString(recievedData);
    if (recievedData.isNotEmpty) {
      //Hive.box('cache').put('homepage', recievedData);
      data = recievedData;
      lists = ['recent', 'playlist', ...?data['collections'] as List?];
      lists.insert((lists.length / 2).round(), 'likedArtists');
    }
    setState(() {});
    recievedData = await FormatResponse.formatPromoLists(data);
    if (recievedData.isNotEmpty) {
      //Hive.box('cache').put('homepage', recievedData);
      data = recievedData;
      lists = ['recent', 'playlist', ...?data['collections'] as List?];
      lists.insert((lists.length / 2).round(), 'likedArtists');
    }
    setState(() {});
  }

  String getPrettyJSONString(jsonObject) {
    var encoder = const JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }

  @override
  Widget build(BuildContext context) {
    if (!fetched) {
      getHomePageData();
      fetched = true;
    }
    if (playlistNames.length >= 3) {
      recentIndex = 0;
      playlistIndex = 1;
    } else {
      recentIndex = 1;
      playlistIndex = 0;
    }
    return data.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, index) {
              List keys = data.keys.toList();
              List list = data.elementAt(index);
              if (list.isNotEmpty) {
                return SectionBuilder(
                  sectionTitle: keys[index].toString(),
                  sectionBodyBuilder: (sectionBodyBuilder) {
                    return HomeSectionsItemsBuilder(
                      list: data.elementAt(index),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          );
  }

  @override
  bool get wantKeepAlive => true;
}

class HomeSectionsItemsBuilder extends StatelessWidget {
  const HomeSectionsItemsBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: ((context, index) {
          final Map item = list[index] as Map;
          bool last = list.length == (index + 1);
          return Padding(
            padding: EdgeInsets.only(
              left: (index == 0) ? 0 : 16,
              right: last ? 16 : 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // img
                Container(
                  width: 138,
                  height: 138,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(item['image']), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                // name
                SizedBox(
                  width: 135,
                  child: Text(item['title'],
                      style: const TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                      textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 4,
                ),
                // show-creator
                SizedBox(
                  width: 135,
                  child: Text(item['type'] ?? '',
                      style: const TextStyle(
                          color: Color(0xffb3b3b3),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
