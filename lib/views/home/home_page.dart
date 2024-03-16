import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/resources/widgets/base_screen/base_consumer_widget.dart';
import 'package:test_flutter/routes/route_const.dart';

class HomePage extends BaseConsumerWidget {
  HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.HOME_PAGE_TITLE),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // context.go("/jokes");
                  pushedName(context, RouteConstants.jokeRouteName);
                },
                child: const Text("Get joke list"))
          ],
        ),
      ),
    );
  }
}
