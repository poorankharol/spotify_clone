import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/cutom_widgets/bouncy_playlist_header_scroll_view.dart';
import 'package:spotify_clone/cutom_widgets/snackbar.dart';
import 'package:spotify_clone/helpers/extensions.dart';
import 'package:spotify_clone/helpers/image_resolution_modifier.dart';
import 'package:spotify_clone/models/song_list.dart';
import 'package:spotify_clone/screens/song_list/providers/song_list_providers.dart';

class SongsListPage extends ConsumerStatefulWidget {
  final Map listItem;

  const SongsListPage({
    super.key,
    required this.listItem,
  });

  @override
  ConsumerState<SongsListPage> createState() => _SongListPageState();
}

class _SongListPageState extends ConsumerState<SongsListPage> {
  List<ListElement?>? songList = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _fetchSongs() {
    try {
      switch (widget.listItem['type'].toString()) {
        case 'songs':
          break;
        case 'album':
          break;
        case 'playlist':
          break;
        case 'mix':
          break;
        case 'show':
          break;
        default:
          ShowSnackBar().showSnackBar(
            context,
            'Error: Unsupported Type ${widget.listItem['type']}',
            duration: const Duration(seconds: 3),
          );
          break;
      }
    } catch (e) {
      print('Error in song_list with type ${widget.listItem["type"]}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      // switch (widget.listItem['type'].toString()) {
      //   case 'songs':
      //     break;
      //   case 'album':
      //     song = ref.watch(fetchAlbumSongsDataProvider(widget.listItem['id'].toString()));
      //     break;
      //   case 'playlist':
      //     song = ref.watch(fetchPlaylistSongsDataProvider(widget.listItem['id'].toString()));
      //     break;
      //   case 'mix':
      //     break;
      //   case 'show':
      //     break;
      //   default:
      //     ShowSnackBar().showSnackBar(
      //       context,
      //       'Error: Unsupported Type ${widget.listItem['type']}',
      //       duration: const Duration(seconds: 3),
      //     );
      //     break;
      // }
      if (widget.listItem['type'].toString() == "album") {
        var song = ref.watch(
            fetchAlbumSongsDataProvider(widget.listItem['id'].toString()));
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: song.when(
            data: (data) {
              songList = data.list;
              return BouncyPlaylistHeaderScrollView(
                scrollController: _scrollController,
                title:
                    widget.listItem['title']?.toString().unescape() ?? 'Songs',
                placeholderImage: 'assets/icons/album.png',
                imageUrl: getImageUrl(widget.listItem['image']?.toString()),
                subtitle: '${songList!.length} Songs',
                secondarySubtitle: widget.listItem['subTitle']?.toString() ??
                    widget.listItem['subtitle']?.toString(),
                sliverList: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          top: 5.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          "Songs",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...songList!.map((entry) {
                        return ListTile(
                          contentPadding: const EdgeInsets.only(left: 15.0),
                          title: Text(
                            '${entry!.title}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          // onLongPress: () {
                          //   copyToClipboard(
                          //     context: context,
                          //     text: '${entry["title"]}',
                          //   );
                          // },
                          subtitle: Text(
                            '${entry.subtitle}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey,fontSize: 14),
                          ),
                          leading: Card(
                            margin: EdgeInsets.zero,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              errorWidget: (context, _, __) => const Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/icons/cover.jpg',
                                ),
                              ),
                              imageUrl:
                                  entry.image!.replaceAll('http:', 'https:'),
                              placeholder: (context, url) => const Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/icons/cover.jpg',
                                ),
                              ),
                            ),
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //   DownloadButton(
                              //     data: entry as Map,
                              //     icon: 'download',
                              //   ),
                              //   LikeButton(
                              //     mediaItem: null,
                              //     data: entry,
                              //   ),
                              //   SongTileTrailingMenu(data: entry),
                            ],
                          ),
                          onTap: () {
                            // PlayerInvoke.init(
                            //   songsList: songList,
                            //   index: songList.indexWhere(
                            //         (element) => element == entry,
                            //   ),
                            //   isOffline: false,
                            // );
                          },
                        );
                      })
                    ],
                  ),
                ),
              );
            },
            error: (error, s) {
              return Center(
                child: Text(
                  s.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      } else {
        var song = ref.watch(
            fetchPlaylistSongsDataProvider(widget.listItem['id'].toString()));
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: song.when(
            data: (data) {
              songList = data.list;
              return BouncyPlaylistHeaderScrollView(
                scrollController: _scrollController,
                title:
                    widget.listItem['title']?.toString().unescape() ?? 'Songs',
                placeholderImage: 'assets/icons/album.png',
                imageUrl: getImageUrl(widget.listItem['image']?.toString()),
                subtitle: '${songList!.length} Songs',
                secondarySubtitle: widget.listItem['subTitle']?.toString() ??
                    widget.listItem['subtitle']?.toString(),
                sliverList: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          top: 5.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          "Songs",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...songList!.map((entry) {
                        return ListTile(
                          contentPadding: const EdgeInsets.only(left: 15.0),
                          title: Text(
                            '${entry!.title}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          // onLongPress: () {
                          //   copyToClipboard(
                          //     context: context,
                          //     text: '${entry["title"]}',
                          //   );
                          // },
                          subtitle: Text(
                            '${entry.subtitle}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                          leading: Card(
                            margin: EdgeInsets.zero,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              errorWidget: (context, _, __) => const Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/icons/cover.jpg',
                                ),
                              ),
                              imageUrl:
                                  entry.image!.replaceAll('http:', 'https:'),
                              placeholder: (context, url) => const Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/icons/cover.jpg',
                                ),
                              ),
                            ),
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //   DownloadButton(
                              //     data: entry as Map,
                              //     icon: 'download',
                              //   ),
                              //   LikeButton(
                              //     mediaItem: null,
                              //     data: entry,
                              //   ),
                              //   SongTileTrailingMenu(data: entry),
                            ],
                          ),
                          onTap: () {
                            // PlayerInvoke.init(
                            //   songsList: songList,
                            //   index: songList.indexWhere(
                            //         (element) => element == entry,
                            //   ),
                            //   isOffline: false,
                            // );
                          },
                        );
                      })
                    ],
                  ),
                ),
              );
            },
            error: (error, s) {
              return Center(
                child: Text(
                  s.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      }
    } catch (e) {
      print('Error in song_list with type ${widget.listItem["type"]}: $e');
    }
    return const SizedBox();
  }
}
