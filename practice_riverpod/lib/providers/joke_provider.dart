import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/services/joke_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/joke.dart';
part 'joke_provider.g.dart';

//Without Code Gen
// final jokeServiceProvider = Provider((ref)=>JokeService());
//
// final randomJokeProvider = FutureProvider<Joke>((ref)async{
//   final jokeService = ref.read(jokeServiceProvider);
//   return jokeService.fetchJoke();
// });

@riverpod
JokeService jokeService(Ref ref){
  return JokeService();
}

@riverpod
Future<Joke> randomJoke (Ref ref) async {
  final jokeService = ref.watch(jokeServiceProvider);
return jokeService.fetchJoke();
}