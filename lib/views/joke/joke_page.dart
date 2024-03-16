import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';
import 'package:test_flutter/resources/widgets/async_data_list_view.dart';
import 'package:test_flutter/resources/widgets/base_screen/base_consumer_widget.dart';
import 'package:test_flutter/routes/route_const.dart';
import 'package:test_flutter/services/joke_service.dart';

class JokeScreen extends BaseConsumerWidget {
  JokeScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokes = ref.watch(jokeServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.JOKE_PAGE_TITLE),
        actions: [
          UnconstrainedBox(
            child: ElevatedButton(
              onPressed: () {
                  context.pushNamed("${RouteConstants.jokeRouteName}Add");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.nearlyWhite,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 5),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(jokeServiceProvider);
          showLoadingWithDuration(context, const Duration(seconds: 1));
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
            Expanded(
              child: AsyncDataListView(
                  data: jokes,
                  listTile: jokeListviewTile,
                  providerNotifier: jokeServiceProvider.notifier,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget jokeListviewTile(BuildContext context,Joke joke, JokeService service) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async{
        if (direction == DismissDirection.endToStart) {
          // remove item with id = joke.id
          bool isDelete = await service.removeById(joke.id!);
          if (isDelete && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${joke.id} deleted')));
          } else if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
          }
        }
      },
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      child: ListTile(
        leading: Text(joke.id.toString()),
        title: Text(joke.type ?? "Error"),
        onTap: () async {
          if (context.mounted) {
            // context.pushNamed("${RouteConstants.jokeRouteName}Detail", extra: joke);
            context.pushNamed("${RouteConstants.jokeRouteName}Add", extra: joke);
          }
          // Joke? data = await service.getById(joke.id!);
          // if (data != null && context.mounted) {
          //   context.pushNamed("${RouteConstants.jokeRouteName}Detail", extra: data);
          // }
        },
        subtitle: Column(
          children: [
            Text(joke.setup ?? "Error"),
            Text(joke.punchline ?? "Error"),
          ],
        ),
      ),
    );
  }
}
