import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_provider.g.dart';

//class based provider
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
//1.Define the initial state
  @override
  bool build(){
    return false; //Defaults to light mode
  }

  //Add the toggle method while avoiding direct mutation
void toggle(){
    state =!state;

}

}
