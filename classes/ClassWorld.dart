import 'dart:io';
import 'ClassField.dart';
import '../Setup.dart';
import '../functions.dart';

//Klasse der Spielwelt. In dieser werden die aktuelle Position und die aktuelle Spielewelt (Overworld, Town, Forest,...) festgehalten

class World {
  /*
  Matrixsystem für die Räume (x,y):
  11 21 31 41 ..
  12 22 32 42 ..
  13 23 33 43 ..
  14 24 34 44 ..
  .. .. .. .. ..
  */

  int currentX;
  int currentY;
  List currentArea = List();
  Field currentField;

  void checkIndex(List list, Field field) {
    //Sucht die aktuellen Koordinaten des Feldes aus der Liste raus und setzt die aktuellen Koordinaten entsprechend

    for (int y = 0; y < list.length; y++) {
      for (int x = 0; x < list[y].length; x++) {
        if (list[y][x] == field) {
          currentX = x;
          currentY = y;
          break;
        }
      }
    }
  }

  void updateField(int xPoint, int yPoint, List currentArea) {
    //bool ob Player auf Hindernis stößt (wird nur durch Finden der Location in der Liste deaktiviert)

    int tmpX;
    int tmpY;
    Field tmpField;
    tmpX = xPoint;
    tmpY = yPoint;
    tmpField = currentArea[tmpY][tmpX];

    if (tmpField == wall) {
      stdout.write("You can't go there!");
    }
    //Falls der Portal String in der neuen Location nicht der gleiche ist (dann Betreten eines neuen Areals)
    else if (tmpField.portalTo != currentField.portalTo &&
        tmpField.portalTo != "") {
      //Aufrufen der changeWorld() Funktion
      changeWorld(tmpField);
    } else {
      //Else normaler Raumwechsel. Location wird gesetzt
      currentX = tmpX;
      currentY = tmpY;
      currentField = tmpField;
      //Loot wird geupdated
      currentField.updateLoot();
      stdout.write("You are at ${currentField.name}.\n");
    }
  }

  void changeWorld(Field targetField) {
    while (true) {
      //Abfrage ob man das Areal wechseln möchte
      List command = input(
          "You are heading to ${targetField.name}, which leads to ${targetField.portalTo}. Do you want to continue? (y/n)");
      if (command[0] == "y") {
        //Ändern der Liste der Räume
        currentArea = worlds[targetField.portalTo];
        //Setzen der Location und Update des Loots
        currentField = portals[targetField.portalTo];
        checkIndex(currentArea, currentField);
        currentField.updateLoot();
        stdout.write("You are at ${currentField.name}\n");
        break;
      } else if (command[0] == "n") {
        stdout.write("You stay at ${currentField.name}\n");
        break;
      } else
        stdout.write("No valid input!\n");
    }
  }
}
