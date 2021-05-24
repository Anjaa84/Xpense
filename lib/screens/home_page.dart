import 'package:flutter/material.dart';
import 'package:revelry_event_management_app/widgets/home_card.dart';
import 'package:revelry_event_management_app/widgets/sizeconfig.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.safeBlockVertical;
    double width = SizeConfig.safeBlockHorizontal;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bck.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[


                    Container(
                        padding: EdgeInsets.fromLTRB(width*7, width*6, width*18, width*2),
                        child: Text('Wedding Plan',style: TextStyle(fontFamily:'Poppins',fontWeight: FontWeight.bold),)),
                    Container(
                        padding: EdgeInsets.fromLTRB(width*6, width*2, width*18, width*2),
                      child: Column(


                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Sort by:"),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                          SizedBox(height: height*3,),
                          Row(
                            children: <Widget>[
                              Text("Order by:"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: width*9,top:width*4),

                  child: Text('At a glance',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),),
              ),

              Expanded(
                flex: 4,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[

                    HomeCard(
                      title: 'Vijay Birthday',
                      place: 'Saphire Hall',
                      dateHours: '28.09.2020 1500hrs',
                      remainingTime:'23hrs 30 mins',
                      indexNumber: '1',
                      height: height * 15,
                      width: width * 14,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}