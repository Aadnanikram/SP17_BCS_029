import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'main_page.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}
class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => main_page())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox( height: 150.0),

          Text("Muhammad Adnan Ikram",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),) ,

          SizedBox( height: 10.0),
          Text("SP17-BCS-029",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),) ,
          SizedBox( height: 10.0),
        CircularProfileAvatar(
        null,child: Image(
            image: AssetImage('images/profile.jpg'),
        ),
           ),
          SizedBox( height: 30.0),
          SpinKitRipple(color: Colors.redAccent, size: 150.0, borderWidth: 10.0,),
        ],

      ),
    );
  }
}