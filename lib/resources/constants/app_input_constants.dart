import 'package:flutter/cupertino.dart';
import 'package:test_flutter/models/app/app_input.dart';

// Icon data
// https://api.flutter.dev/flutter/material/Icons-class.html

class AppInputConstants {
  static List<AppInput> jokeInputs = [
    AppInput(
      hint: "Input title",
      icon: const IconData(0xe668, fontFamily: 'MaterialIcons'),
      slug: 'title',
    ),
    AppInput(
      hint: "Input setup",
      icon: const IconData(0xe57f, fontFamily: 'MaterialIcons'),
      slug: 'setup',
    ),
    AppInput(
      hint: "Input punchline",
      icon: const IconData(0xe59d, fontFamily: 'MaterialIcons', matchTextDirection: true),
      slug: 'punchLine',
    ),
  ];
}