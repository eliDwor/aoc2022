import 'dart:io';

nightThree() {
  File file = new File('input_data/3_input.txt');
  List data = [];
  List<String> lines = file.readAsLinesSync();
  lines.forEach((e) => data.add(e));
}
