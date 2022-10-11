import 'package:flutter/material.dart';

class CharacterState extends ChangeNotifier {
  CharacterSheet? currentCharacter = null;
  List<CharacterSheet>? sheets = null;

  CharacterState({this.currentCharacter = null, this.sheets = null}) {}
}

class CharacterSheet {
  String name = "";
  String description = "";
  String img = ""; // img url
  int ebs = 0; // eddies
  int damage = 0;
  Armor armor = Armor();
  Stats stats = Stats();
  Stats currStats = Stats();
}

class Armor {
  int head = 0;
  int body = 0;
  int lArm = 0;
  int rArm = 0;
  int lLeg = 0;
  int rLeg = 0;
}

class Stats {
  int Int = 2;
  int ref = 2;
  int tech = 2;
  int cool = 2;
  int attr = 2;
  int luck = 2;
  int ma = 2;
  int body = 2;
  int emp = 2;
}

class Skill {
  String name = '';
  int statBonus = 0;
  int skillBonus = 0;
  int timesRolled = 0;
}
