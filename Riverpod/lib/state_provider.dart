import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_demo/sliderProvider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("main widget...");
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod", textAlign: TextAlign.center)),
      body: Column(
        children: [
          
          Consumer(builder: (ctx,ref,child){
            final password = ref.watch(sliderProvider.select(((state)=>state.showPassword)));
            return InkWell(
              onTap: (){
                final stateProvide =ref.read(sliderProvider.notifier);
                stateProvide.state = stateProvide.state.copyWith(showPassword: !password);
              },
              child: password ? Icon(Icons.remove_red_eye):Icon(Icons.panorama_fish_eye),
            );
          }),
          Consumer(
            builder: (ctx, ref, child) {
              print("container builde...");
              final sliderValue = ref.watch(sliderProvider.select((state)=>state.slider));

              return Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: sliderValue),
                ),
              );
            },
          ),

          Consumer(builder: (ctx,ref,child){
            print("slider builde...");

            final sliderValue = ref.watch(sliderProvider.select((state)=>state.slider));
            return
                Slider(value: sliderValue, onChanged: (value){
                  final stateProvider = ref.read(sliderProvider.notifier);
                  //emitting new state
                stateProvider.state=  stateProvider.state.copyWith(slider: value);
                });
          })
        ],
      ),
    );
  }
}
