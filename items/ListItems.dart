import '../classes/ClassItem.dart';

//Liste der Items, welche im Loot auftauchen können
List items = [rustyKnife, sleepingBag, tinder, softwood, hardwood, stone];

//Items des Spiels
Item rustyKnife = Item("rusty knife", -1, 0.1, 1);
Item sleepingBag = Item("sleeping bag", -1, 1.5, 15);
Item tinder = Item("tinder", 40, 0.05, 0.1);
Item softwood = Item("softwood", 20, 1, 3);
Item hardwood = Item("hardwood", 20, 2, 3);
Item stone = Item("stone", 60, 2.5, 3);
