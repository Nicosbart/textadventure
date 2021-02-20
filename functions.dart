import 'dart:io';
import 'classes/ClassBackpack.dart';
import 'classes/ClassWorld.dart';

//Funktion um Eingabe abzufragen und die einzelne Wörter in eine Liste zu tragen
List input(String print) {
  stdout.write(print + "\n>> ");
  List input = stdin.readLineSync().toLowerCase().split(" ");
  if (input.length >= 3) {
    input[1] = input[1] + " " + input[2];
  }
  return input;
}

//Funktion für ein Pausenmenü
void pauseMenu() {
  bool loop = true;
  while (loop) {
    List command = input(
        "\n\nPause Menu \ncontinue (c) \nsafe (s) \nload (l) \nexit game (exit).");
    switch (command[0]) {
      case "c":
        stdout.write("\n\nYou continued the Game.");
        loop = false;
        break;
      case "s":
        stdout.write("\n\nInput not assigned yet.");
        //loop = false;
        break;
      case "l":
        stdout.write("\n\nnput not assigned yet.");
        //loop = false;
        break;
      case "exit":
        while (true) {
          List command = input("Do you really want to leave the game? (y/n)");
          if (command[0] == "y") {
            stdout.write("\nThank you for playing!\n");
            exit(0);
          } else if (command[0] == "n") {
            break;
          } else {
            stdout.write("\nInvalid command.\n");
          }
        }
        break;
      default:
        {
          stdout.write("\nInvalid command.");
        }
    }
  }
}

//Switch-Case funktion, welche die Eingabe des Spielers verarbeitet
void execute(World world, Backpack backpack, List currentArea) {
  List command = input("\nWhat will you do next?");
  switch (command[0]) {
    case "up":
    case "u":
    case "north":
    case "n":
      {
        world.updateField(world.currentX, world.currentY - 1, currentArea);
      }
      break;
    case "down":
    case "d":
    case "south":
    case "s":
      {
        world.updateField(world.currentX, world.currentY + 1, currentArea);
      }
      break;
    case "left":
    case "l":
    case "west":
    case "w":
      {
        world.updateField(world.currentX - 1, world.currentY, currentArea);
      }
      break;
    case "right":
    case "r":
    case "east":
    case "e":
      {
        world.updateField(world.currentX + 1, world.currentY, currentArea);
      }
      break;
    case "pause":
      {
        pauseMenu();
      }
      break;
    case "help":
      {
        stdout.write(help);
      }
      break;
    case "check":
      {
        world.currentField.check();
      }
      break;
    case "take":
      {
        if (command.length > 1) {
          backpack.addToInventory(world.currentField.loot, command[1]);
        } else if (command.length == 1 || command[1] == " ") {
          stdout.write("no item choosen.");
        }
      }
      break;
    case "drop":
      {
        if (command.length > 1) {
          backpack.removeFromInventory(world.currentField.loot, command[1]);
        } else if (command.length == 1 || command[1] == " ") {
          stdout.write("no item choosen.");
        }
      }
      break;
    case "backpack":
      {
        backpack.checkInventory();
      }
      break;
    case "quit":
      exit(0);
      break;
    default:
      {
        stdout.write("\nInvalid command\n");
      }
  }
}

//Text, der nach dem "help" Befehl erscheint
String help =
    "\nCommand List\n'up'/down'/'left'/'right': Move that way\n'check': Check out what you can see around you\n'take' + something: Take that thing and put it in your backpack\n'drop' + something: Drop something out of your backpack\n'backpack': Check your backpack\n'help': Get this exactly help dialog\n'exit: Exit the game\n";

//Funktion, die die print() Funktion überschreibt und den Text in einer bestimmten Geschwindigkeit wiedergibt
void printSlow(String text, [int t = 70]) {
  Duration duration = Duration(milliseconds: t);
  for (int i = 0; i < text.length; i++) {
    var c = text[i];
    stdout.write(c);
    sleep(duration);
  }

  //Funktion, die eine XP-Leiste ausgibt
  // ignore: unused_element
  void xpProgressBar(int xp, int xpToNextLevel) {
    List bar = List(20);
    double tmp = 20 * (xp / xpToNextLevel);
    int progress = tmp.round();
    stdout.write("\n\nWert: $progress\n");

    for (int i = 0; i < bar.length; i++) {
      if (i < progress) {
        bar[i] = "x";
      } else {
        bar[i] = " ";
      }
    }
    stdout.write("[");
    for (var b in bar) {
      stdout.write(b);
    }
    stdout.write("]");
  }
}
