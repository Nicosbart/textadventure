import 'areas/Overworld.dart';
import 'areas/Town.dart';
import 'classes/ClassWorld.dart';
import 'classes/ClassBackpack.dart';
import 'classes/ClassField.dart';

//die Setup Datei für alles, was im vorraus erstellt werden muss

//Maps mit den Verschiedenen Welten und Portalen zwischen den Welten
Map worlds = {"overworld": listOverworld, "town entrance": listTown};
Map portals = {"overworld": town, "town entrance": entrance};

Field wall = Field("you can't go there");

//Erstellen der Welt
World world = World();

//Erstellen des Rucksack des Players
Backpack playerBackpack = Backpack(40);
