import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//create a stram provider
final ticketProvider = StreamProvider<int>((ref){
  return Stream.periodic(const Duration(seconds: 1), (count)=> count);
});

//ui screen to display data
class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Provider'),
      ),
      body: Consumer(builder: (ctx,ref,child){
        final stream = ref.watch(ticketProvider);
        return Center(
          child: stream.when(
            loading: ()=> const CircularProgressIndicator(),
              data:(data)=> Text('Second Elapsed: $data'),
              error:(e, _)=> Column(
                mainAxisSize: .min,
                children: [
                  Text("error: $e",style: const TextStyle(color: Colors.red),),
                  const SizedBox(height: 12,),
                  ElevatedButton(onPressed: (){
                    ref.refresh(ticketProvider);
                  }, child: Text("Retry"))
                ],
              )
          )
        );
      }),
    );
  }
}
