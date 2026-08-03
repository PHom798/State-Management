import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/services/joke_service.dart';

import '../model/joke.dart';

final jokeServiceProvider = Provider((ref)=>JokeService());

final randomJokeProvider = FutureProvider<Joke>((ref)async{
  final jokeService = ref.read(jokeServiceProvider);
  return jokeService.fetchJoke();
});