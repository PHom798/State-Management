import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practice_riverpod/model/joke.dart';

class JokeService {
  final Dio _dio =Dio();

  Future<Joke> fetchJoke() async{
    try{
      final response = await _dio.get(
          'https://official-joke-api.appspot.com/random_joke'
      );

      return Joke.fromJson(response.data);

    }
    on DioException catch(e){
      throw Exception('Failed to load joke :${e.message}');
    }
  }
}