import 'Setup.dart';
import 'functions.dart';
import 'areas/Overworld.dart';

void main(List<String> args) {
  //printSlow("\nWelcome to the Game!\n\ntype 'help' to see commands.\n");
  world.currentArea = listOverworld;
  world.currentField = sign;
  world.currentX = 2;
  world.currentY = 2;

  while (true) {
    execute(world, playerBackpack, world.currentArea);
  }
}
