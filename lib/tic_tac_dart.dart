import "dart:ffi";
import "dart:io";

class TicTacDart {
  String? playerPosition = "";

  List<String> playerOne = [];
  List<String> playerTwo = [];

  List<List<String>> winningPositions = [
    ['1 1', '1 2', '1 3'],
    ['2 1', '2 2', '2 3'],
    ['3 1', '3 2', '3 3'],
    ['1 1', '2 1', '3 1'],
    ['1 2', '2 2', '3 2'],
    ['1 3', '2 3', '3 3'],
    ['1 1', '2 2', '3 3'],
    ['1 3', '2 2', '3 1'],
  ];

  bool playerOneTurn = false;
  bool completed = false;

  int totalTurns = 4;
  List<List<String>> table = [];
  Map<String, String> positions = {
    '1 1': '0 0',
    '1 2': '0 2',
    '1 3': '0 4',
    '2 1': '2 0',
    '2 2': '2 2',
    '2 3': '2 4',
    '3 1': '4 0',
    '3 2': '4 2',
    '3 3': '4 4',
  };

  TicTacDart() {
    drawTable();
  }

  void drawTable() {
    this.table = [
      [' ', '|', ' ', '|', ' '],
      ['-', '-', '-', '-', '-'],
      [' ', '|', ' ', '|', ' '],
      ['-', '-', '-', '-', '-'],
      [' ', '|', ' ', '|', ' ']
    ];
  }

  void printTable() {
    for (var row in table) {
      for (var rowElement in row) {
        stdout.write(rowElement);
      }
      stdout.writeln();
    }
  }

  void singlePlayer() {
    printTable();
    while (totalTurns > 0 && !completed) {
      //if (playerOneTurn) {
      stdout.writeln("Select a position: ");
      playerPosition = stdin.readLineSync();

      totalTurns--;

      String? findPosition = positions[playerPosition];

      List<String> selectedPosition = findPosition!.split(' ');

      int rowPosition = int.parse(selectedPosition[0]);
      int columnPosition = int.parse(selectedPosition[1]);

      String tablePosition = table[rowPosition][columnPosition];

      if (['x', 'o'].contains(tablePosition)) {
        stdout.writeln("The position is already used. Selected another one");
        return;
      }

      table[rowPosition][columnPosition] = 'x';
      playerOne.add(playerPosition!);
      printTable();

      if (playerOne.length == 3) {
        for (var element in winningPositions) {
          if (element[0] == playerOne[0] &&
              element[1] == playerOne[1] &&
              element[2] == playerOne[2]) {
            completed = true;
          }
        }

        if (completed) {
          stdout.writeln("Player 1 has won");
          return;
        }
      }
      //}
    }
  }
}
