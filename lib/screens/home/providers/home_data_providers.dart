import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/core/home/home_data_api.dart';
import 'package:spotify_clone/core/home/home_data_repository.dart';
import 'package:spotify_clone/shared/dio_provider.dart';

final homeDataApiProvider = Provider((ref) {
  return HomeDataApi(ref.read(dioClientProvider));
});

final homeDataRepositoryProvider = Provider((ref) {
  return HomeDataRepository(ref.read(homeDataApiProvider));
});

final homeDataDataProvider = FutureProvider((ref) {
  return ref.read(homeDataRepositoryProvider).fetchHomeData();
});
