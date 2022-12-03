import 'dart:io';

//a is 97 ->1
//if lower sub 96
//A is 65 ->27
//if upp sub 38

nightThree() {
  File file = new File('input_data/3_input.txt');
  List data = [];
  List<String> lines = file.readAsLinesSync();
  lines.forEach((e) => data.add(e));

  //split lines in half
  var ruck_1;
  var ruck_2;
  int score = 0;

  for (String ruck in data) {
    var length = ruck.length;
    ruck_1 = ruck.substring(0, (length / 2).round());
    ruck_2 = ruck.substring((length / 2).round(), length);

    for (String item in ruck_1.split('')) {
      if (ruck_2.contains(item)) {
        score += calcScore(item);
        break;
      }
    }
  }

  return score;
}

//elves come in groups of 3
int sumOfBadges() {
  File file = new File('input_data/3_input.txt');
  List data = [];
  List<String> lines = file.readAsLinesSync();
  lines.forEach((e) => data.add(e));
  int score = 0;
//AHHH there has to be a better way to do this, but it works
  for (int i = 0; i < data.length - 2; i += 3) {
    for (var item in data[i].split('')) {
      if (data[i + 1].contains(item) && data[i + 2].contains(item)) {
        score += calcScore(item);
        break;
      }
    }
  }

  return score;
}

int calcScore(String character) {
  int charCode = character.codeUnitAt(0);
  return charCode > 96 ? charCode - 96 : charCode - 38;
}
