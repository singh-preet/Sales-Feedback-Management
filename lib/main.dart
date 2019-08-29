import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import './Profile.dart';
void main() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark));
    runApp(MaterialApp(
    home:LogIn(),
    theme: ThemeData(primaryColor: Colors.black),
    debugShowCheckedModeBanner: false,));
  
} 

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text("Sign In"),backgroundColor: Colors.white,),
      body:
      ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:120.0,left: 35.0),
            child: Container(child: Text("Welcome \n Back", style: TextStyle(color: Colors.pinkAccent,fontSize: 30,),),),
          ),
          Container(child: TextField( decoration: InputDecoration(hintText: "UserName"),),padding: EdgeInsets.all(20),),
          Container(child: TextField( decoration: InputDecoration(hintText: "Password"),),padding: EdgeInsets.all(20),),
          Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: Container(child: Row(children: <Widget>
            [Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(child:Text("Sign In",style:TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),)),
              ),
              Expanded(child:Container()),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: GestureDetector(
                  child: Container(child: Icon(Icons.arrow_forward, color: Colors.white,size: 30.0,),
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent],),shape: BoxShape.circle,boxShadow:[BoxShadow(color:Colors.deepPurple.withOpacity(0.6), blurRadius: 5,offset: Offset(-5,5))] ),
                    height: 70,width: 70,),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Profile()
                    ));
                  } ,
                ),
              )

            ],),),
          )
        ],),

    );
  }
}
