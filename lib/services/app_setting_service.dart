/// RUN "dart run build_runner watch -d" IN CMD TO GENERATE RIVERPOD CODE
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/resources/utils/data_sources/local.dart';

part 'app_setting_service.g.dart';

@riverpod
class AppSettingService extends _$AppSettingService {
  double _fontSize = 16;

  get fontSize => _fontSize;

  @override
  FutureOr<List> build() async {
    return _fetchData();
  }

  Future<List> _fetchData() async{
    _fontSize = (await SharedPre.instance).getDouble(SharedPrefsConstants.FONT_SIZE_KEY) ?? _fontSize;
    return [_fontSize];
  }

  Future<bool> changeFontSize(double fontSize) async {
    try {
      (await SharedPre.instance).setDouble(SharedPrefsConstants.FONT_SIZE_KEY, fontSize);
      return true;
    } catch (e) {
      return false;
    }
  }
}