import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';


class TaskDetails extends StatefulWidget {

  @override
  TaskDetailsState createState() => TaskDetailsState();
}

class TaskDetailsState extends State<TaskDetails> {

  TimeOfDay start;
  TimeOfDay stop;
  startTime() {
    setState(() {
      start=TimeOfDay.now();
      return start;
    });}
   stopTime() {
      setState(() {
        stop=TimeOfDay.now();
      });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Container(child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCdaNh_dfprF_34gma8gsjfNbCGNItH1ZnsCQC6nXEgYM1I7Nh',fit: BoxFit.contain ,),
                           width: double.maxFinite,),
        ),
        Row(
          children: <Widget>[
            MaterialButton(height: 40,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),color: Colors.deepPurple,child: Text("Start", style: TextStyle(color: Colors.white),),onPressed: (){
              startTime();
            }),
            Container(child: Text('$start'),)
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(child: Text("Stop"),onPressed: (){
              stopTime();
            }),
            Container(child: Text(''
                ''
                '$stop'),)
          ],
        ),
      ],)
    );
  }
}
