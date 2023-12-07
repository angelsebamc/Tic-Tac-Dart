import "dart:ffi";
import "dart:io";
import "dart:math";

class TicTacDart {
  final playerOneSymbol = 'x';
  final playerTwoSymbol = 'o';

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

  bool playerOneTurn = true;
  bool completed = false;

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

  bool positionIsInUse(String positionSelected) =>
      [playerOneSymbol, playerTwoSymbol].contains(positionSelected);

  void switchTurn() => playerOneTurn = !playerOneTurn;

  String computerMove() {
    String computerPosition = '';
    var positionKeys = positions.keys.toList();

    final random = Random();
    int position = random.nextInt(positionKeys.length);

    do {
      computerPosition = positionKeys[position];
    } while (positionIsInUse(computerPosition));

    return computerPosition;
  }

  void selectPosition(List<String> player) {
    String playerName = playerOneTurn ? 'Player 1' : 'Player 2';
    String symbol = playerOneTurn ? playerOneSymbol : playerTwoSymbol;

    String? findPosition = positions[playerPosition];

    List<String> selectedPosition = findPosition!.split(' ');

    int rowPosition = int.parse(selectedPosition[0]);
    int columnPosition = int.parse(selectedPosition[1]);

    String tablePosition = table[rowPosition][columnPosition];

    if (positionIsInUse(tablePosition)) {
      stdout.writeln("The position is already used. Selected another one");
      return;
    }

    table[rowPosition][columnPosition] = symbol;
    player.add(playerPosition!);
    totalTurns--;
    printTable();

    if (player.length == 3) {
      player.sort();
      print(player);

      for (var element in winningPositions) {
        if (element[0] == player[0] &&
            element[1] == player[1] &&
            element[2] == player[2]) {
          completed = true;
        }
      }

      if (completed) {
        stdout.writeln("$playerName has won");
        return;
      }
    }
    switchTurn();
  }

  void singlePlayer() {
    printTable();
    while (totalTurns > 0 && !completed) {
      if (playerOneTurn) {
        stdout.write("Select a position: ");
        playerPosition = stdin.readLineSync();

        selectPosition(playerOne);
      } else {
        playerPosition = computerMove();
        selectPosition(playerTwo);
      }
    }
  }
}
