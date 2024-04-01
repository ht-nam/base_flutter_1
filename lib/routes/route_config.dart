import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/resources/utils/data_sources/local.dart';
import 'package:test_flutter/routes/route_const.dart';
import 'package:test_flutter/views/home/home_page.dart';
import 'package:test_flutter/views/joke/add_joke_page.dart';
import 'package:test_flutter/views/joke/joke_detail_page.dart';
import 'package:test_flutter/views/joke/joke_page.dart';

class MyRouter{
  static String initialLocation = "/";
  late GoRouter router = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        name: RouteConstants.homeRouteName,
        path: '/',
        builder: (context,state) => HomePage(),
        // redirect: isAuthenticated
      ),
      GoRoute(
        name: RouteConstants.jokeRouteName,
        path: '/${RouteConstants.jokeRouteName}',
        builder: (context,state) => JokeScreen(),
      ),
      GoRoute(
        name: "${RouteConstants.jokeRouteName}Add",
        path: '/${RouteConstants.jokeRouteName}/add',
        builder: (context,state) => AddJokeScreen(joke: state.extra == null ? null : state.extra as Joke),
      ),
      GoRoute(
        name: "${RouteConstants.jokeRouteName}Detail",
        path: '/${RouteConstants.jokeRouteName}/detail',
        builder: (context,state) => JokeDetailScreen(joke: state.extra as Joke),
      ),
    ],
  );

  FutureOr<String?> isAuthenticated(BuildContext context, GoRouterState route) async {
    if ((await SharedPre.instance).getString(SharedPrefsConstants.ACCESS_TOKEN_KEY) == null) {
      return '/login';
    }
    return null;
  }

}