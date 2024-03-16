import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/models/joke.dart';
import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/resources/widgets/base_screen/base_consumer_state.dart';
import 'package:test_flutter/resources/widgets/base_screen/base_consumer_widget.dart';

class JokeDetailScreen extends BaseConsumerWidget {
  JokeDetailScreen({key, required this.joke}) : super(key: key);
  final Joke joke;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${AppConstants.JOKE_PAGE_TITLE} : ${joke.id}'),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Title: ${joke.type}'),
              Text('Setup: ${joke.setup}'),
              Text('Punchline: ${joke.punchline}'),
            ],
          ),
        ),
      ),
    );
  }
}
