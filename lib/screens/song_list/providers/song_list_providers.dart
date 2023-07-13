import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/core/song_list/song_list_api.dart';
import 'package:spotify_clone/core/song_list/song_list_respository.dart';
import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/models/song_list.dart';
import 'package:spotify_clone/shared/dio_provider.dart';

final songListApiProvider = Provider((ref) {
  return SongListApi(ref.read(dioClientProvider));
});

final songListRepositoryProvider = Provider((ref) {
  return SongListRepository(ref.read(songListApiProvider));
});

final fetchSongSearchResultsDataProvider = FutureProvider.family<SongList,String>((ref,searchQuery) {
  return ref.read(songListRepositoryProvider).fetchSongSearchResults(searchQuery: searchQuery);
});

final fetchAlbumSongsDataProvider = FutureProvider.family<SongList,String>((ref,albumId) {
  return ref.read(songListRepositoryProvider).fetchAlbumSongs(albumId);
});

final fetchPlaylistSongsDataProvider = FutureProvider.family<PlayList,String>((ref,playlistId) {
  return ref.read(songListRepositoryProvider).fetchPlaylistSongs(playlistId);
});

