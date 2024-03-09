/// RUN "dart run build_runner watch -d" IN CMD WHEN THIS SERVICE HAVE ANY CHANGE TO GENERATE RIVERPOD CODE
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:test_flutter/resources/utils/data_sources/dio_client.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/resources/constants/constants.dart';

part 'joke_service.g.dart';

@riverpod
class JokeService extends _$JokeService {
  Future<List<Joke>> _fetchList() async {
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

  Future<Joke?> getById(int id) async{
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

  Future<Joke?> addOrUpdate(Joke joke) async{
    try {
      print('----------- addJoke: ----------');
      final url = ApiConstants.BASE_URL + ApiConstants.JOKE;
      // temp api (api is not available)
      // final response = await DioClient().post(url, data: joke.toJson());
      // return Joke.fromJson(response as Map<String, dynamic>);
      return Joke();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> removeById(int id) async{
    try {
      print('----------- removeJoke: $id ----------');
      final url = "${ApiConstants.BASE_URL + ApiConstants.JOKE}/$id";
      // temp api (api is not available)
      // await DioClient().delete(url);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  FutureOr<List<Joke>> build() async {
    return _fetchList();
  }
}