import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/provider/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureRef = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider")),
      body: Center(
        child: futureRef.when(
          skipLoadingOnRefresh: false,
          data: (value) => ListView.builder(itemCount:value.length,itemBuilder: (context,index){
            return Text(value[index].toString());
          }),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.invalidate(futureProvider);
      }),
    );
  }
}
