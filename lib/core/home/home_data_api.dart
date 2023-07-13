import 'package:dio/dio.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/core/network/endpoints.dart';

class HomeDataApi {
  final DioClient _dioClient;

  HomeDataApi(this._dioClient);

  Future<Response> fetchHomeDataRequest() async {
    try {
      final res = await _dioClient.get("${Endpoints.apiStr}&${Endpoints.endpoints['homeData']}");
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
