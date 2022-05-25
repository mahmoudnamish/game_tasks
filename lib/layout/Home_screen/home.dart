import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../game_logic/game_logic.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ActivePlayer = 'X';
  bool gameOver= false;
  int Current =0;
  String result= 'winer';
  Game game = Game();
  bool Switch = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:SafeArea(
        child: Column(children:
        [
           SwitchListTile.adaptive(
             title: Text('Turn on/off two player',
                 style: TextStyle(color: Colors.white,fontSize: 28),
                 textAlign: TextAlign.center),
               value: Switch,
               onChanged: (bool index){
               setState(() {
                 Switch = index;
               });

               }),
          Text('It\'s $ActivePlayer turn'.toUpperCase(),
              style: TextStyle(color: Colors.white,fontSize: 52),
              textAlign: TextAlign.center),
          Expanded(child: GridView.count(
            padding:EdgeInsets.all(18) ,
              mainAxisSpacing:8
            ,crossAxisSpacing:8 ,
             childAspectRatio:1 ,
               crossAxisCount:3,
            children: List.generate(9, (index) =>
                InkWell(
              onTap:gameOver?null: ()=> onTap(index),
              child:Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                  child:Center(
                   child:Text(
                        Player.Playerx.contains(index)?'X' :
                        Player.Playero.contains(index)?'O':'',
                        style:TextStyle(
                            color: Player.Playerx.contains(index)?Colors.deepOrange: Colors.yellowAccent,fontSize: 30)),
                 ),
              ) ,
            ))
          )),
          Text(' $result '.toUpperCase(),
              style: TextStyle(color: Colors.white,fontSize: 42),
              textAlign: TextAlign.center),
          ElevatedButton.icon(onPressed: (){
            setState(() {
              Player.Playero=[];
              Player.Playerx=[];
              String ActivePlayer = 'X';
              bool gameOver=false;
              int  Current =0;
              String result= 'X';
            });
          },
              icon: Icon(Icons.repeat),
              label: Text('repeat to Game'),
            style:ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue) ) ,
          
          )
          
        ]),
      ));
  }

  onTap(int index) {
    if((Player.Playerx.isEmpty||!Player.Playerx.contains(index))||
       ( Player.Playero.isEmpty||!Player.Playero.contains(index))
    )
    game.playGame(index,ActivePlayer);
   setState(() {
     ActivePlayer =(ActivePlayer=='X')?'O':'X';

   });
  }

 
}


