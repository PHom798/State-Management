import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state_notifier_provider.dart';

class SearchProviderScreen extends ConsumerWidget {
  const SearchProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("State Notifier Provider")),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (ctx, ref, child) {
              print("only one widget build...");
              final searchProv = ref.watch(searchProvider.select((state)=> state.search));
              return Text(searchProv, style: TextStyle(color: Colors.red));
            },
          ),

          Consumer(builder: (ctx,ref,child){
            print("switch build");
            final boolProvider = ref.watch(searchProvider.select((state)=>state.isChange));
            return Switch(value: boolProvider, onChanged:(value){
              ref.read(searchProvider.notifier).onChange(value);

            });
          })
        ],
      ),
    );
  }
}
