import 'dart:io';
import '../items/ListItems.dart';
import 'dart:math';

//Klasse für die Räume, in welcher sich der Spieler bewegt

class Field {
  String name;
  bool lootable; //Gibt es Loot im Raum
  String portalTo; //Name des Portals zu dem der Field führt
  List loot = List(); //Liste von zufällig generiertem Loot
  String hint;

  Field(String name,
      {bool lootable = true, String hint = "", String portalTo = ""}) {
    this.name = name;
    this.portalTo = portalTo;
    this.lootable = lootable;
    this.hint = hint;

    if (lootable) {
      this.loot = generateLoot(items);
    }
  }

  void updateLoot() {
    if (lootable) {
      this.loot = generateLoot(items);
    }
  }

//Funktion, welche zufällig Loot im Raum generiert
  List generateLoot(List items) {
    List loot = List();
    var rnd = Random();
    for (var item in items) {
      //Zufallszahl generieren
      int prob = rnd.nextInt(100);

      //Falls die Zufallszahl <= der Wahrscheinlichkeit des items ist
      if (prob <= item.probability) {
        //Schaue, wie oft die Zufallszahl in die Wahrscheinlichkeit passt (je kleiner die Zufallszahl, desto größer der Erfolg)
        int amount = item.probability ~/
            (prob + 1); //+1 weil sonst Chance durch null zu teilen
        if (amount > 5) amount = 5;

        //Item so oft in den Raum packen (maximal 5 mal)
        for (int i = 0; i < amount; i++) {
          loot.add(item);
        }
      }
    }
    return loot;
  }

  //Gibt eine Liste mit der Häufigkeit der darin enthaltenen Einträge aus
  void countAndPrint(List list) {
    Map map = Map();
    list.forEach((l) {
      if (!map.containsKey(l)) {
        map[l] = 1;
      } else
        map[l] += 1;
    });

    map.forEach((k, v) => stdout.write("$v ${k.name}, "));
  }

  //Schauen, was in dem Raum an Loot liegt
  void check() {
    stdout.write("You are at $name.\n");
    if (hint != "") {
      stdout.write(hint);
    }
    stdout.write("You see ");
    if (loot.length == 0) {
      stdout.write("nothing.");
    } else {
      countAndPrint(loot);
    }
  }
}
