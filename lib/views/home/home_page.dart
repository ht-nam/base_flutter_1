import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/routes/route_const.dart';
import 'package:test_flutter/views/user/joke_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.HOME_PAGE_TITLE),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // context.go("/jokes");
                    context.pushNamed(RouteConstants.jokeRouteName);
                  },
                  child: const Text("Get joke list"))
            ],
          ),
        ),
      ),
    );
  }
}
