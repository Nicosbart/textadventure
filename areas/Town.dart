import '../Setup.dart';
import '../classes/ClassField.dart';

/* (x,y)

 wa  wa   wa  wa 
 wa [11] [21] wa
 wa [12] [22] wa
 wa  wa   wa
*/

List listTown = [
  [wall, wall, wall, wall],
  [wall, entrance, marketplace, wall],
  [wall, home, alley, wall],
  [wall, wall, wall]
];

Field entrance = Field("town entrance", lootable: false, portalTo: "overworld");
Field marketplace = Field("marketplace", lootable: false);
Field home = Field("home", lootable: false);
Field alley = Field("alley", lootable: false);
