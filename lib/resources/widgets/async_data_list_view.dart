import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/models/base.dart';
import 'package:test_flutter/services/joke_service.dart';

class AsyncDataListView extends ConsumerStatefulWidget {
  const AsyncDataListView({super.key, required this.data, this.listTile, this.providerNotifier});
  final AsyncValue data;
  final Function? listTile;
  final Refreshable? providerNotifier;

  @override
  ConsumerState createState() => _AsyncDataListViewState();
}

class _AsyncDataListViewState extends ConsumerState<AsyncDataListView> {

  @override
  Widget build(BuildContext context) {
    final service = ref.read(widget.providerNotifier as ProviderListenable);

    return widget.data.when(
      data: (data) => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: data.length ?? 0,
        itemBuilder: (_, index) => widget.listTile != null ? widget.listTile!(data[index], service) : listviewTile(data[index]),
      ),
      error: (error, stackTrace) => Center(child: Text("Error: $error")),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget listviewTile(Base modal) {
    return ListTile(
      leading: Text('${modal.id}'),
      title: const Text("Title"),
      // onTap: ,
      subtitle: Column(
        children: const [
          Text("Subtitle 1"),
          Text("Subtitle 2"),
        ],
      ),
    );
  }
}


