import 'dart:io';

newNight() {
  File file = new File('input_data/4_input.txt');
  List data = [];
  List<String> lines = file.readAsLinesSync();
  lines.forEach((e) => data.add(e));
  int found_pairs = 0;
  for (var elfTeam in data) {
    var elf1 = elfTeam.split(",")[0];
    var elf2 = elfTeam.split(",")[1];

    int a = int.parse(elf1.split('-')[0]);
    int b = int.parse(elf1.split('-')[1]);
    int c = int.parse(elf2.split('-')[0]);
    int d = int.parse(elf2.split('-')[1]);

    if (checkOverlap(a, b, c, d)) {
      found_pairs++;
    }
  }
  print(found_pairs);
}

bool checkInRange(int a, int b, int c, int d) {
  if ((a <= c && b >= d) || (c <= a && d >= b)) {
    return true;
  } else {
    return false;
  }
}

bool checkOverlap(int a, int b, int c, int d) {
  if ((b >= c && a <= d) || (d >= a && c <= b)) {
    return true;
  } else {
    return false;
  }
}
