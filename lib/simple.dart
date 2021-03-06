import 'package:exam/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:alert_dialog/alert_dialog.dart';
import 'main_page.dart';
int left_dice=1;
int right_dice=1;
int left_count=0;
int right_count=0;
String winer=null;
class simple extends StatefulWidget {
  @override
  _simpleState createState() => _simpleState();
}
class _simpleState extends State<simple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Easy Mode"),
    ),
        drawer: Drawer(
          child: ListView(
            children:<Widget> [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text('Options', textAlign:TextAlign.left , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                ),
              ),
              ListTile(
                title: Text('Home Screen', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>main_page()));
                },
              ),
              ListTile(
                title: Text('Exit', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                onTap: () {
                  exit(0);
                },
              )
            ],
          ),
        ),
      body: Container(
        color: Colors.cyan,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Role Dice",style: TextStyle(fontSize: 50,color: Colors.black),),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FlatButton(onPressed: (){
                    setState(() {
                      left_dice=Random().nextInt(5)+1;
                      left_count=left_count+left_dice;
                    });
                  }
                    , child: Container(
                        width: 150.0,
                        height: 150.0,
                        margin: EdgeInsets.only(left: 20),
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/dice$left_dice.png')
                            )
                        )),
                  ),
                ),
                Expanded(
                  child: FlatButton(onPressed: (){
                    setState(() {
                      right_dice=Random().nextInt(5)+1;
                      right_count=right_count+right_dice;
                    });
                  }
                    , child: Container(
                        width: 150.0,
                        height: 150.0,
                        margin: EdgeInsets.only(left: 30),
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/dice$right_dice.png')
                            )
                        )),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(top: 100),
              child: FlatButton(onPressed: (){
                setState(() {
                  Check();
                  alert(
                    context,
                    title: Text('Winer is',textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
                    content: Text('$winer',textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                    textOK: Text('OK'),
                  );
                });
              }
                  , child: Text("Check Result",style: TextStyle(fontSize: 30,color: Colors.white),)),
            ),
          ],
        ),

      ),
    );

  }
  void Check()
  {
    if (left_count>=right_count)
      {
        winer= "Winer is Left Dice";
      }
    else
      {
        winer= "Winer is Right Dice";
      }
  }
}
