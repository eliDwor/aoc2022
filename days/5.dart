import 'helper_functions.dart';

List day5Data = inputToArray(5);

day5() {
  //generate our 9 stacks
  List allStacks = [];
  for (int i = 0; i < 9; i++) {
    print("added${i}");
    List presentStack = [];
    allStacks.add(presentStack);
  }
  // read the first 8 lines of the input data
  for (int i = 7; i >= 0; i--) {
    var line = day5Data[i];
    //populate each stack with our data
    for (int j = 1; j < 9 * 4; j += 4) {
      // print(line[j]);
//gr9 maffs
      if (line[j] != " ") {
        allStacks[((j - 1) / 4).round()].add(line[j]);
      }
    }
  }

  //now to loop through the movement
  for (int i = 10; i < day5Data.length; i++) {
    List instruction = day5Data[i]
        .replaceAll("move", "")
        .replaceAll("from", "")
        .replaceAll("to", "")
        .split(" ");

    int crates = int.parse(instruction[1]);
    int from = int.parse(instruction[3]);
    int to = int.parse(instruction[5]);

//part 1 solution
    // for (int e = 0; e < crates; e++) {
    //   if (allStacks[from - 1].isNotEmpty) {
    //     allStacks[to - 1].add(allStacks[from - 1].last);
    //     allStacks[from - 1].removeLast();
    //   }
    // }

// part 2 chunking
    if (crates == 1 && allStacks[from - 1].isNotEmpty) {
      allStacks[to - 1].add(allStacks[from - 1].last);
      allStacks[from - 1].removeLast();
    } else {
      var craneUp = [];
      for (int e = 0; e < crates; e++) {
        if (allStacks[from - 1].isNotEmpty) {
          craneUp.add(allStacks[from - 1].last);
          allStacks[from - 1].removeLast();
        }
      }

      allStacks[to - 1].addAll(craneUp.reversed);
      craneUp.clear();
    }
  }

  for (var stack in allStacks) {
    print(stack.last);
  }
  // print(allStacks);
}

class Stack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);

  E pop() => _list.removeLast();

  E get peek => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}
