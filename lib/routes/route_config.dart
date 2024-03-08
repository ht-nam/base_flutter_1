import 'package:go_router/go_router.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/routes/route_const.dart';
import 'package:test_flutter/views/home/home_page.dart';
import 'package:test_flutter/views/user/joke_detail_page.dart';
import 'package:test_flutter/views/user/joke_page.dart';

class MyRouter{
  static String initialLocation = "/";
  late GoRouter router = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        name: RouteConstants.homeRouteName,
        path: '/',
        builder: (context,state) => const HomePage(),
      ),
      GoRoute(
        name: RouteConstants.jokeRouteName,
        path: '/${RouteConstants.jokeRouteName}',
        builder: (context,state) => const JokePage(),
      ),
      GoRoute(
        name: "${RouteConstants.jokeRouteName}Detail",
        path: '/${RouteConstants.jokeRouteName}/detail',
        builder: (context,state) => JokeDetail(joke: state.extra as Joke),
      ),
    ],
  );

}