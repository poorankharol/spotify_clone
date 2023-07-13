import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:spotify_clone/core/song_list/song_list_api.dart';
import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/models/song_list.dart';

class SongListRepository {
  final SongListApi _api;

  SongListRepository(this._api);

  Future<SongList> fetchSongSearchResults({
    required String searchQuery,
    int count = 20,
    int page = 1,
  }) async {
    try {
      final res = await _api.fetchSongSearchResults(searchQuery: searchQuery);
      return songListFromMap(res.data);
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<SongList> fetchAlbumSongs(String albumId) async {
    try {
      final res = await _api.fetchAlbumSongs(albumId);
      return songListFromMap(res.data);
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<PlayList> fetchPlaylistSongs(String playlistId) async {
    try {
      final res = await _api.fetchPlaylistSongs(playlistId);
      return playListFromMap(res.data);
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<SongList> getSongFromToken(String token,
      String type, {
        int n = 10,
        int p = 1,
      }) async {
    try {
      final res = await _api.getSongFromToken(token,type,n: n,p: p);
      return songListFromMap(res!.data);
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }
}
