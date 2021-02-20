import 'dart:io';

//Klasse des Inventars

class Backpack {
  List inventory = List();
  double weight =
      1.85; //Gewicht des Rucksacks --> Wirkt sich auf die Ausdauer aus (1.85 = Startwert für Messer, Schlafsack und Tinder)
  double capacity =
      16.5; //aktuelles Füllvolumen des Rucksacks (16.5 = Startwert für Messer, Schlafsack und Tinder)
  double maxCapacity;

  Backpack(double maxCapacity) {
    this.maxCapacity = maxCapacity;
  }

  //Funktion, um ein item in den Rucksack zu legen
  void addToInventory(List loot, String item) {
    //Falls die Loot Liste nicht leer ist (es also noch Loot im Raum gibt)
    //Durch die Loot Liste iterieren
    if (loot.length != 0) {
      //Falls dieses item auch in der Loot Liste ist (es dieses item also im Raum gibt)
      for (var i in loot) {
        //Falls das aktuell in der Liste angeschaute item das gesuchte ist
        if (i.name == item) {
          //Falls der Rucksack mit dem aufgenommenen item nicht voll wird
          if ((capacity + i.volume) <= maxCapacity) {
            //item in Rucksack, Gewicht und Volumen addieren und item aus dem Raum nehmen
            inventory.add(i);
            weight += i.weight;
            capacity += i.volume;
            loot.remove(i);
            stdout.write("1 ${item} stored in backpack.");
            break;
          } else
            stdout.write("Your backpack is too full for that!\n");
        }
      }
    }
  }

  //Wie in addToInventory(), nur andersrum
  void removeFromInventory(List loot, String item) {
    if (inventory.length != 0) {
      for (var i in inventory) {
        if (i.name == item) {
          inventory.remove(i);
          weight -= i.weight;
          capacity -= i.volume;
          loot.add(i);
          stdout.write("1 ${item} dropped.");
          break;
        }
      }
    } else
      stdout.write("There is nothing to drop!");
  }

  //prüft, was aktuell im Rucksack ist und gibt auch Gewicht und Kapazität an
  void checkInventory() {
    stdout.write("\nYou open your backpack to find ");
    if (inventory.length == 0) {
      stdout.write("nothing.\n");
    } else {
      countAndPrint(inventory);
      stdout.write(".\n");
    }
    stdout.write("weight: ${double.parse((weight).toStringAsFixed(2))}.\n");
    stdout.write(
        "volume: ${double.parse((capacity).toStringAsFixed(2))}/${double.parse((maxCapacity).toStringAsFixed(2))}.\n");
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
}
