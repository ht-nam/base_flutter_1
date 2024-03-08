import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/resources/widgets/async_data_list_view.dart';
import 'package:test_flutter/routes/route_const.dart';
import 'package:test_flutter/services/joke_service.dart';

class JokePage extends ConsumerStatefulWidget {
  const JokePage({super.key});

  @override
  ConsumerState<JokePage> createState() => _JokePageState();
}

class _JokePageState extends ConsumerState<JokePage> {
  @override
  Widget build(BuildContext context) {
    final jokes = ref.watch(jokeServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.JOKE_PAGE_TITLE),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(jokeServiceProvider);
            // ref.refresh(jokeServiceProvider);
            },
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("List of joke"),
              ),
              AsyncDataListView(data: jokes, listTile: jokeListviewTile, providerNotifier: jokeServiceProvider.notifier),
            ],
          ),
        ),
      ),
    );
  }

  Widget jokeListviewTile(Joke joke, JokeService service) {
    return ListTile(
      leading: Text(joke.id.toString()),
      title: Text(joke.type ?? "Error"),
      onTap: () async {
        if (context.mounted) {
          context.pushNamed("${RouteConstants.jokeRouteName}Detail", extra: joke);
        }
        // Joke? data = await service.getJokeById(joke.id!);
        // if (data != null && context.mounted) {
        //   context.pushNamed("${RouteConstants.jokeRouteName}Detail", extra: data);
        // }
      },
      subtitle: Column(
        children: [
          Text(joke.setup ?? "Error"),
          Text(joke.punchLine ?? "Error"),
        ],
      ),
    );
  }
}