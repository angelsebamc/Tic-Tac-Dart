import "dart:ffi";
import "dart:io";

class TicTacDart {
  String? playerPosition = "";

  List<String> playerOne = [];
  List<String> playerTwo = [];

  List<List<String>> winningPositions = [
    ['0 0', '0 1', '0 2'],
    ['1 0', '1 1', '1 2'],
    ['2 0', '2 1', '2 2'],
    ['0 0', '1 0', '2 0'],
    ['1 1', '2 1', '2 1'],
    ['2 0', '2 1', '2 2'],
    ['0 0', '1 1', '2 2'],
    ['0 2', '1 1', '2 0'],
  ];

  bool playerOneTurn = false;

  int totalTurns = 9;
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
    while (totalTurns > 0) {
      if (playerOneTurn) {
        stdout.writeln("Select a position: ");
        playerPosition = stdin.readLineSync();

        String? findPosition = positions[playerPosition];

        List<String> selectedPosition = findPosition!.split(' ');

        int rowPosition = selectedPosition[0] as int;
        int columnPosition = selectedPosition[1] as int;

        String tablePosition = table[rowPosition][columnPosition];
        
        if(['x', 'o'].contains(tablePosition)) {
          stdout.writeln("The position is already used. Selected another one");
          return;
        }


      }
    }
  }
}
