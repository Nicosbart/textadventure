import 'dart:io';

//Klasse für Charakter der Welt

class Character {
  String name;
  int hp;
  int attack;
  int xp = 0;

  Character(String name, int hp, int attack) {
    this.name = name;
    this.hp = hp;
    this.attack = attack;
  }

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
