import 'helper_functions.dart';

var data = inputToArray(6);
List buffer = data[0].split('');

day6() {
  Set message = {};

  for (int i = 0; i < buffer.length; i++) {
    Iterable chunk = buffer.sublist(i, i + 14);
    message.addAll(chunk);
    if (message.length == 14) {
      print(i + 14);
      break;
    }
    message.clear();
  }
}
