import '../classes/ClassField.dart';
import '../Setup.dart';

List listOverworld = [
  [wall, wall, wall, wall, wall],
  [wall, field11, town, field31, wall],
  [wall, field12, sign, field32, wall],
  [wall, field13, path, field33, wall],
  [wall, field14, forest, field34, wall],
  [wall, wall, wall, wall, wall]
];

//Räume in der Spielerwelt
Field field11 = Field("Raum 11");
Field field12 = Field("Raum 12");
Field field13 = Field("Raum 13");
Field field14 = Field("Raum 14");
Field town = Field("town gates", lootable: false, portalTo: "town entrance");
Field sign = Field("path",
    lootable: false,
    hint: "You see a sign. It says: 'town: north, forest: south'.\n");
Field path = Field("path");
Field forest = Field(
  "Forest entrance",
  lootable: false,
);
Field field31 = Field("Raum 31");
Field field32 = Field("Raum 32");
Field field33 = Field("Raum 33");
Field field34 = Field("Raum 34");
