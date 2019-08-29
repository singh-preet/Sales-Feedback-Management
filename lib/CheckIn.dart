import 'package:flutter/material.dart';

class CheckIn extends StatefulWidget {
  final TimeOfDay checkIn;
  CheckIn(this.checkIn);
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("You started the task at:" + "${widget.checkIn}"),
      ),
    );
  }
}

class CheckOut extends StatefulWidget {
  final TimeOfDay checkOut;
  CheckOut(this.checkOut);
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Center(child:Icon(Icons.done,color: Colors.green,size: 90,)),
    Container(child:Text("Congratulations! Today's tasks have been completed.",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),)
    ],)
    );  }
}
