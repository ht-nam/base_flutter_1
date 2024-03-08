import 'package:flutter/material.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/resources/constants/constants.dart';

class JokeDetail extends StatelessWidget {
  const JokeDetail({super.key, required this.joke});
  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppConstants.JOKE_PAGE_TITLE} : ${joke.id}'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Title: ${joke.type}'),
            Text('Setup: ${joke.setup}'),
            Text('Punchline: ${joke.punchLine}'),
          ],
        ),
      ),
    );
  }
}
