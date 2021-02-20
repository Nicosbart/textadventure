//Klasse extra für Items

class Item {
  String name;
  int probability; //Wahrscheinlichkeit, dass das Item im zufälligen Loot erscheint
  double weight;
  double volume;

  Item(String name, int prob, double weight, double volume) {
    this.name = name;
    this.probability = prob;
    this.weight = weight;
    this.volume = volume;
  }
}
