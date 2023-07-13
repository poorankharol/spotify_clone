import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/core/network/endpoints.dart';

class SongListApi {
  final DioClient _dioClient;

  SongListApi(this._dioClient);

  Future<Response> fetchSongSearchResults({
    required String searchQuery,
    int count = 20,
    int page = 1,
  }) async {
    try {
      final String params =
          "${Endpoints.apiStr}&p=$page&q=$searchQuery&n=$count&${Endpoints.endpoints['getResults']}";
      final res = await _dioClient.get(params);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchAlbumSongs(String albumId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.apiStr}&${Endpoints.endpoints['albumDetails']}&cc=in&albumid=$albumId');
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchPlaylistSongs(String playlistId) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.apiStr}&${Endpoints.endpoints['playlistDetails']}&cc=in&listid=$playlistId');
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getSongFromToken(
    String token,
    String type, {
    int n = 10,
    int p = 1,
  }) async {
    try {
      if (n == -1) {
        final String params =
            "${Endpoints.apiStr}&token=$token&type=$type&n=5&p=$p&${Endpoints.endpoints['fromToken']}";
        final res =  await _dioClient.get(params);
        if (res.statusCode == 200) {
          final Map getMain = json.decode(res.data) as Map;
          final String count = getMain['list_count'].toString();
          final String params2 =
              "${Endpoints.apiStr}&token=$token&type=$type&n=$count&p=$p&${Endpoints.endpoints['fromToken']}";
          return await _dioClient.get(params2);
        }
      } else {
        final String params =
            "${Endpoints.apiStr}&token=$token&type=$type&n=$n&p=$p&${Endpoints.endpoints['fromToken']}";
        return await _dioClient.get(params);
      }
    } catch (e) {
      print('Error in getSongFromToken: $e');
    }
    return null;
  }
}
