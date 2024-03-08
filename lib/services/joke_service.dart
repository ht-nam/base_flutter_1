/// RUN "dart run build_runner watch -d" IN CMD WHEN THIS SERVICE HAVE ANY CHANGE TO GENERATE RIVERPOD CODE
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:test_flutter/resources/utils/data_sources/dio_client.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/resources/constants/constants.dart';

part 'joke_service.g.dart';

@riverpod
class JokeService extends _$JokeService {
  Future<List<Joke>> _fetchJokeList() async {
    try {
      print('----------- getJokeList ----------');
      final url = "${ApiConstants.BASE_URL + ApiConstants.JOKE}/ten";
      final response = await DioClient().get(url);
      return List.from(response.data!.map((e) => Joke.fromJson(e as Map<String, dynamic>)).toList());
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Joke?> getJokeById(int id) async{
    try {
      print('----------- getJoke ----------');
      final url = "${ApiConstants.BASE_URL + ApiConstants.JOKE}/$id";
      final response = await DioClient().get(url);
      return Joke.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  FutureOr<List<Joke>> build() async {
    return _fetchJokeList();
  }
}