class Player{
  static const x ='X';
  static const o ='O';
  static const empty ='';
 static  List<int>Playerx=[];
 static List<int>Playero=[];

}


class Game{
  void playGame(int index, String activePlayer) {
    if(activePlayer=='X')
      Player.Playerx.add(index);
    else
      Player.Playero.add(index);
  }
  checkwinner(){}

 
}