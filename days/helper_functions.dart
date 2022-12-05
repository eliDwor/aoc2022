import 'dart:io';

List inputToArray(int dayNum) {
  File file = new File('input_data/${dayNum}_input.txt');
  List data = [];
  List<String> lines = file.readAsLinesSync();
  lines.forEach((e) => data.add(e));

  return data;
}
