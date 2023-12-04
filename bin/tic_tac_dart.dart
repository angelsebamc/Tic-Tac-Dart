import 'package:tic_tac_dart/menu.dart';
import 'package:tic_tac_dart/tic_tac_dart.dart' as tic_tac_dart;
import 'package:tic_tac_dart/menu.dart' as menu;


void main() {
  // final console = Console();
  // console
  //   ..setBackgroundColor(ConsoleColor.blue)
  //   ..setForegroundColor(ConsoleColor.white)
  //   ..writeLine('Simple Demo', TextAlignment.center)
  //   ..resetColorAttributes()
  //   ..writeLine()
  //   ..writeLine('This console window has ${console.windowWidth} cols and '
  //       '${console.windowHeight} rows.')
  //   ..writeLine()
  //   ..writeLine('This text is left aligned.', TextAlignment.left)
  //   ..writeLine('This text is center aligned.', TextAlignment.center)
  //   ..writeLine('This text is right aligned.', TextAlignment.right);

  // for (final color in ConsoleColor.values) {
  //   console
  //     ..setForegroundColor(color)
  //     ..writeLine(color.toString().split('.').last);
  // }
  // console.resetColorAttributes();

  var ticTacDart = tic_tac_dart.TicTacDart();
  var gameMenu = menu.Menu();

  gameMenu.draw();
}