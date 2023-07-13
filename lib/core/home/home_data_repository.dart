import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:spotify_clone/core/home/home_data_api.dart';
import 'package:spotify_clone/models/home_data.dart';

class HomeDataRepository {
  final HomeDataApi _api;

  HomeDataRepository(this._api);

  Future<HomeData> fetchHomeData() async {
    try {
      final res = await _api.fetchHomeDataRequest();
      return homeDataFromMap(res.data);
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }
}
