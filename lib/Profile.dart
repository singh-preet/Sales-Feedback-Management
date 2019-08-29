import './main.dart';
import 'package:flutter/material.dart';
import './TaskDetails.dart';
import './CheckIn.dart';
import 'package:vibrate/vibrate.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile>  with TickerProviderStateMixin {
  TabController control;
  @override
  void initState() {
    control=TabController(length: 2, vsync: this);
    super.initState();
  }

  TimeOfDay start;
  TimeOfDay stop;
  startTime() {
    setState(() {
      start=TimeOfDay.now();
    });}
  stopTime() {
    setState(() {
      stop=TimeOfDay.now();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
      Padding(
        padding: const EdgeInsets.only(top:40.0),
        child: Column( children: <Widget>[
          TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.black38,
            labelColor: Colors.black38,
            tabs: <Tab>[
              new Tab(
                text: "Profile",
              ),
              new Tab(
                text: "Tasks",
              ),
            ],
            controller: control,
          ),
        Container(
          height: MediaQuery.of(context).size.height-90,
          width: double.maxFinite,
          child: TabBarView(
            controller: control,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(child:CircleAvatar(
                      backgroundImage: NetworkImage('https://s3.amazonaws.com/uifaces/faces/twitter/mrmoiree/128.jpg'),radius: 80,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(child: Text("Welcome John Doe", style: TextStyle(fontSize: 20,),),),
                  ),
                  Container(child: Text("Attendance: 74%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),),
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Container(child: Text("Tasks Completed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),),
                  ),
                  start!=null?Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Container(child: Text("Check In Time: ${start.hour} hr ${start.minute} mins", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),),
                  ):Container(),
                  stop!=null?Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Container(child: Text("Check Out Time: ${stop.hour} hr ${stop.minute} mins", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),),
                  ):Container(),
                  Expanded(child:Container()),

                  Container(
                    child:
                    start==null? Padding(
                      padding: const EdgeInsets.only(right:8.0, bottom: 20),
                      child: GestureDetector(
                        child: Container(
                          child: Center(child: Text("Check In",style: TextStyle(color:Colors.white),)),
                          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent.withOpacity(0.8)]),borderRadius: BorderRadius.circular(20)),
                          height: 50,width: 100,
                        ),
                        onTap: (){
                          Vibrate.vibrate();
                          showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                              title: Text("Are you sure you want to Check In?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Yes"),
                                  onPressed: (){
                                    startTime();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text("No"),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                              );
                            }
                          );
                          },
                      ),
                    ):stop==null?Padding(
                      padding: const EdgeInsets.only(right:8.0, bottom: 20),
                      child: GestureDetector(
                        child: Container(
                          child: Center(child: Text("Check Out",style: TextStyle(color:Colors.white),)),
                          decoration: BoxDecoration(gradient: LinearGradient(colors: [stop!=null?Colors.pink:Colors.deepPurple, stop!=null?Colors.pinkAccent:Colors.deepPurpleAccent]),borderRadius: BorderRadius.circular(20)),
                          height: 50,width: 100,
                        ),
                        onTap: (){
                          Vibrate.vibrate();
                          if(stop==null) {
                            showDialog(context: context,
                            builder: (BuildContext context)   {
                              return AlertDialog(
                                title: Text("Are you sure you want to Check Out?"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Yes'),
                                    onPressed: (){
                                      stopTime();
                                      Navigator.of(context).pop();
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => CheckOut(stop)));
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            }
                            );
                          }},
                      ),
                    ):Padding(
               padding: const EdgeInsets.only(right:8.0, bottom: 20),
             child: GestureDetector(
             child: Container(
              child: Center(child: Text("Sign Out",style: TextStyle(color:Colors.white),)),
             decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent]),borderRadius: BorderRadius.circular(20)),
             height: 50,width: 100,
              ),
               onTap:(){
               showDialog(
                 context: context,
                 builder: (BuildContext context){
                   return AlertDialog(
                    title: Text("Do you want to Sign Out?"),
                     actions: <Widget>[
                       FlatButton(
                          child: Text("Yes"),
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>LogIn()
                            ));

                          },
                   ),
                       FlatButton(
                         child: Text("No"),
                         onPressed: (){
                           Navigator.of(context).pop();
                         },
                       )


                     ],


                   );
                 }
               );


               } ,
             ),),)
                  ]
                  ),
              Container(color: Colors.grey[200],
                child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("In Flutter, an Animation object knows nothing about what is onscreen. An Animation is an abstract class that understands its current value and its state (completed or dismissed). ",
                          style: TextStyle(color: Colors.black,),
                        ),),
                        decoration: BoxDecoration(color:Colors.white, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4),blurRadius: 0.5,offset: Offset(-5,5))] ),
                        height: 100,
                      ),
                    ),onTap: (){
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>TaskDetails())
                      );
                  }
                    ,
                  );
                },
                ),
              )
            ],
          ),
        ),
        ]
        ),
      ) );
  }
}
