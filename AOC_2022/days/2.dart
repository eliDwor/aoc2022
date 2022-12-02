import 'dart:io';

//your score is calculated as the 3rd char in the string
//X-1 Y-2 Z-3
//opp is the second char in the string
// 0 points if you lose, 3 for a tie and 6 for a win

int rps_score_gen(String you, String them) {
  int score = 0;
  if (you == 'X') {
    score += 1;
    if (them == 'A') {
      score += 3;
    }

    if (them == 'C') {
      score += 6;
    }
  }
  if (you == 'Y') {
    score += 2;
    if (them == 'A') {
      score += 6;
    }
    if (them == 'B') {
      score += 3;
    }
    if (them == 'C') {}
  }
  if (you == 'Z') {
    score += 3;

    if (them == 'B') {
      score += 6;
    }
    if (them == 'C') {
      score += 3;
    }
  }

  return score;
}

int adapted_rps_score(String you, String them) {
  //X is a loss, Y is tie, Z is win

  int score = 0;

  if (you == 'Y') {
    score += 3;
  }
  if (you == 'Z') {
    score += 6;
  }

  if (them == 'A') {
    if (you == 'X') {
      score += 3;
    }
    if (you == 'Y') {
      score += 1;
    }
    if (you == 'Z') {
      score += 2;
    }
  }
  if (them == 'B') {
    if (you == 'X') {
      score += 1;
    }
    if (you == 'Y') {
      score += 2;
    }
    if (you == 'Z') {
      score += 3;
    }
  }
  if (them == 'C') {
    if (you == 'X') {
      score += 2;
    }
    if (you == 'Y') {
      score += 3;
    }
    if (you == 'Z') {
      score += 1;
    }
  }

  return score;
}

rps_tourney() {
  File file = new File('2_input.txt');
  List rps_data = [];
  List<String> lines = file.readAsLinesSync();
  lines.forEach((l) => rps_data.add(l));
  int total_score = 0;

  for (var game in rps_data) {
    //or change to rps_score() method for part 1
    total_score += adapted_rps_score(game[2], game[0]);
  }
  return total_score;
}
