import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MainCard extends StatelessWidget {
  final String title;
  final String date;
  final String task;
  final String guests;

  final String remainingTime;
 final double height, width;

  const MainCard({Key key, this.title, this.date, this.task, this.guests, this.remainingTime, this.height, this.width, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder:(context)=>MyHomePage(),
        ));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 24, 0),
        height: height*2,
        child: Container(
          padding: EdgeInsets.only(left: width),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/box.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(width * 0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Container(
                      padding:
                      EdgeInsets.fromLTRB(0, width * 0.3, 0, width * 0.1),
                      child: Text(title,style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),)),
                  Text(date,style: TextStyle(fontSize: 10,fontFamily: 'Poppins'),),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(width*2) ,
                        ),

                        child: Text(' 2 tasks',style: TextStyle(fontSize: 10,fontFamily: 'Poppins'),),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(width*2) ,
                        ),

                        child: Text(' 150 guests ',style: TextStyle(fontSize: 10,fontFamily: 'Poppins'),),
                      ),
                    ],
                  )

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      padding:
                      EdgeInsets.fromLTRB(0, width * 0.8,width*0.2, width * 0.1),
                      child: Text("Remaining time",style: TextStyle(fontSize: 10,fontFamily: 'Poppins'),)),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, width * 0.1,0, width * 0.9),
                      child: Text(remainingTime,style: TextStyle(color: Colors.red,fontFamily: 'Poppins'),)),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
