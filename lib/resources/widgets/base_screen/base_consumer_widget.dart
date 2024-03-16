import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/resources/widgets/base_screen/base_screen.dart';

class BaseConsumerWidget extends ConsumerWidget with BaseScreen {
  BaseConsumerWidget({super.key}) {
    setupBase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    throw UnimplementedError();
  }
}
