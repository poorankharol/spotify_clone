import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/api/api.dart';
import 'package:spotify_clone/cutom_widgets/snackbar.dart';
import 'package:spotify_clone/helpers/extension.dart';
import 'package:spotify_clone/helpers/extensions.dart';
import 'package:spotify_clone/screens/home/providers/home_data_providers.dart';
import 'package:spotify_clone/screens/home/widget/section_builder.dart';
import 'package:spotify_clone/screens/song_list/song_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var homeData = ref.watch(homeDataDataProvider);
    return homeData.when(data: (data) {
      Map home = data.toMap();
      return Column(
        children: [
          SectionBuilder(
            sectionTitle: 'Trending Now',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['new_trending'],
              );
            },
          ),
          SectionBuilder(
            sectionTitle: 'Top Charts',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['charts'],
              );
            },
          ),
          SectionBuilder(
            sectionTitle: 'New Releases',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['new_albums'],
              );
            },
          ),
          SectionBuilder(
            sectionTitle: 'Pick Your Mood',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['browse_discover'],
              );
            },
          ),
          SectionBuilder(
            sectionTitle: 'Editorial Picks',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['top_playlists'],
              );
            },
          ),
          SectionBuilder(
            sectionTitle: 'Radio Stations',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['radio'],
              );
            },
          ),
          SectionBuilder(
            sectionTitle: 'Recommended Artist Stations',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['artist_recos'],
              );
            },
          ),
          SectionBuilder(
            sectionTitle: 'Whats Hot In Ahmedabad',
            sectionBodyBuilder: (sectionBodyBuilder) {
              return HomeSectionsItemsBuilder(
                list: home['city_mod'],
              );
            },
          ),
        ],
      );
    }, error: (error, s) {
      return Center(
        child: Text(s.toString()),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class HomeSectionsItemsBuilder extends StatelessWidget {
  const HomeSectionsItemsBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List list;

  String getSubTitle(Map item) {
    final type = item['type'];
    switch (type) {
      case 'charts':
        return '';
      case 'radio_station':
        return 'Radio • ${(item['subtitle']?.toString() ?? '').isEmpty ? 'JioSaavn' : item['subtitle']?.toString().unescape()}';
      case 'playlist':
        return 'Playlist • ${(item['subtitle']?.toString() ?? '').isEmpty ? 'JioSaavn' : item['subtitle'].toString().unescape()}';
      case 'song':
        return 'Single • ${item['artist']?.toString().unescape()}';
      case 'mix':
        return 'Mix • ${(item['subtitle']?.toString() ?? '').isEmpty ? 'JioSaavn' : item['subtitle'].toString().unescape()}';
      case 'show':
        return 'Podcast • ${(item['subtitle']?.toString() ?? '').isEmpty ? 'JioSaavn' : item['subtitle'].toString().unescape()}';
      case 'album':
        final artists = item['more_info']?['artistMap']?['artists']
            .map((artist) => artist['name'])
            .toList();
        if (artists != null) {
          return 'Album • ${artists?.join(', ')?.toString().unescape()}';
        } else if (item['subtitle'] != null && item['subtitle'] != '') {
          return 'Album • ${item['subtitle']?.toString().unescape()}';
        }
        return 'Album';
      default:
        final artists = item['more_info']?['artistMap']?['artists']
            .map((artist) => artist['name'])
            .toList();
        return artists?.join(', ')?.toString().unescape() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: ((context, index) {
          final Map item = list[index] as Map;
          bool last = list.length == (index + 1);
          return GestureDetector(
            onTap: () {
              if (item['type'] == 'radio_station') {
                ShowSnackBar().showSnackBar(
                  context,
                  "Connecting Radio",
                  duration: const Duration(seconds: 2),
                );
                // SaavnAPI()
                //     .createRadio(
                //   names: item['more_info']
                //   ['featured_station_type']
                //       .toString() ==
                //       'artist'
                //       ? [
                //     item['more_info']['query']
                //         .toString()
                //   ]
                //       : [item['id'].toString()],
                //   language: item['more_info']['language']
                //       ?.toString() ??
                //       'hindi',
                //   stationType: item['more_info']
                //   ['featured_station_type']
                //       .toString(),
                // )
                //     .then((value) {
                //   if (value != null) {
                //     SaavnAPI()
                //         .getRadioSongs(stationId: value)
                //         .then((value) {
                //       PlayerInvoke.init(
                //         songsList: value,
                //         index: 0,
                //         isOffline: false,
                //         shuffle: true,
                //       );
                //     });
                //   }
                // });
              } else {
                if (item['type'] == 'song') {
                  // PlayerInvoke.init(
                  //   songsList: currentSongList as List,
                  //   index: currentSongList.indexWhere(
                  //         (e) => e['id'] == item['id'],
                  //   ),
                  //   isOffline: false,
                  // );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => SongsListPage(listItem: item),
                    ),
                  );
                }
              }
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: (index == 0) ? 10 : 16,
                right: last ? 16 : 10,
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
                          image: NetworkImage(item['image']),
                          fit: BoxFit.cover),
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
                    child: Text(getSubTitle(item) ?? '',
                        style: const TextStyle(
                            color: Color(0xffb3b3b3),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
