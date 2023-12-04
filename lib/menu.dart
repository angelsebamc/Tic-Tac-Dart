import 'package:dart_console/dart_console.dart';
import "dart:io";

class Menu {
  final console = Console();

  void draw() {
    console
      ..setBackgroundColor(ConsoleColor.blue)
      ..setForegroundColor(ConsoleColor.white)
      ..writeLine('xoxoxo TIC-TAC-DART xoxoxo', TextAlignment.center)
      ..resetColorAttributes()
      ..writeLine()
      ..writeLine()
      ..writeLine('1 - Single Player', TextAlignment.left)
      ..writeLine('2 - Two Players', TextAlignment.left)
      ..writeLine('3 - Exit', TextAlignment.left);
  }
}
