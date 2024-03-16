import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/models/app/app_input.dart';
import 'package:test_flutter/resources/constants/app_input_constants.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';
import 'package:test_flutter/resources/widgets/base_screen/base_consumer_state.dart';
import 'package:test_flutter/resources/widgets/rounded_input.dart';
import 'package:test_flutter/services/joke_service.dart';

import '../../models/joke.dart';

class AddJokeScreen extends ConsumerStatefulWidget {
  const AddJokeScreen({super.key, this.joke});
  final Joke? joke;

  @override
  ConsumerState createState() => _AddJokeScreenState();
}

class _AddJokeScreenState extends BaseConsumerState<AddJokeScreen> {
  Map<String, TextEditingController> jokeTextControllers = {
    'title': TextEditingController(),
    'setup': TextEditingController(),
    'punchLine': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    final jokeService = ref.read(jokeServiceProvider.notifier);
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.joke == null ? "Add Joke" : "Edit Joke"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _inputView(),
              ElevatedButton(
                  onPressed: () async {
                    final joke = widget.joke ?? Joke();
                    final Joke? rs = await jokeService.addOrUpdate(joke);
                    if (context.mounted && rs != null) {
                      showLoading(context, true);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${joke.type} added')));
                      await ref.refresh(jokeServiceProvider.future);
                      showLoading(context, false);
                      context.pop();
                    } else if (context.mounted) {
                      showLoading(context, true);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
                      showLoading(context, false);
                    }
                  },
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
    final data = widget.joke?.toJson();

    for (AppInput input in AppInputConstants.jokeInputs) {
      RoundedInput roundedInput = RoundedInput(
        hint: input.hint,
        icon: input.icon,
        textEditingController: jokeTextControllers[input.slug] ?? TextEditingController(),
      );
      print('data: ${widget.joke}');
      roundedInput.textEditingController.text = data?[input.slug] ?? '';
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
