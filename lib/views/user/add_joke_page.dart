import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/models/app/app_input.dart';
import 'package:test_flutter/resources/constants/app_input_constants.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';
import 'package:test_flutter/resources/widgets/rounded_input.dart';

import '../../models/joke.dart';

class AddJokeScreen extends ConsumerStatefulWidget {
  const AddJokeScreen({super.key, this.joke});
  final Joke? joke;

  @override
  ConsumerState createState() => _AddJokeScreenState();
}

class _AddJokeScreenState extends ConsumerState<AddJokeScreen> {
  Map<String, TextEditingController> jokeTextControllers = {
    'title': TextEditingController(),
    'setup': TextEditingController(),
    'punchLine': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Add Joke"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _inputView(),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _inputInput() {
    List<Widget> listInput = [];

    for (AppInput input in AppInputConstants.jokeInputs) {
      RoundedInput roundedInput = RoundedInput(
        hint: input.hint,
        icon: input.icon,
        textEditingController: jokeTextControllers[input.slug] ?? TextEditingController(),
      );
      // roundedInput.textEditingController.text = '';
      listInput.add(roundedInput);
    }

    return listInput;
  }

  Widget _inputView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          ..._inputInput(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
