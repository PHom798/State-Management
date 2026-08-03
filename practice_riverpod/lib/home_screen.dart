import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/providers/joke_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Joke Generator')),
      body: Consumer(builder: (ctx,ref,child){
        final randomJoke = ref.watch(randomJokeProvider);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: randomJoke.when(
                loading: () => const CircularProgressIndicator(),

                error: (error, stackTrace) => Text(
                  error.toString(),
                ),

                data: (joke) => SelectableText(
                  '${joke.setup}\n\n${joke.punchline}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),


            ElevatedButton(onPressed: (){
              ref.invalidate(randomJokeProvider);
        }, child: Text("Next Joke")),


          ],
        );

      },)
    );
  }
}