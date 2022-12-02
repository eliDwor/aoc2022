import 'dart:io';

find_elf() {
  File file = new File('input_data/1_input.txt');
  List calorie_data = [];
  List<String> lines = file.readAsLinesSync();
  lines.forEach((l) => calorie_data.add(l));

  List<int> top_elves = [];
  var current_elf = 0;

  for (var cal in calorie_data) {
    //on to a different elf
    if (cal == "") {
      top_elves.add(current_elf);
      current_elf = 0;
    } else {
      current_elf += int.parse(cal);
    }
  }

  top_elves.sort();

  return top_elves[top_elves.length - 1] +
      top_elves[top_elves.length - 2] +
      top_elves[top_elves.length - 3];
}
