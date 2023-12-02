import "dart:io";

class TicTacDart {
  List<List<String>> table = [];

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
}
