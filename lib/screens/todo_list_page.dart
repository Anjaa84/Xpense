import 'package:flutter/material.dart';
import 'package:revelry_event_management_app/widgets/sizeconfig.dart';
import 'package:revelry_event_management_app/widgets/todo_card.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
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
                        padding: EdgeInsets.fromLTRB(width*2, width*7, width*10, width*2),
                        child: Text('Wedding Plan',style: TextStyle(fontFamily:'Poppins',fontWeight: FontWeight.bold),)),
                    Container(
                      padding: EdgeInsets.fromLTRB(width*4, width*2, width*8, width*2),
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
                  padding: EdgeInsets.only(left: width*13,top:width*4),

                  child: Text('Todos',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),),
              ),

              Expanded(
                flex: 4,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[

//
                    TodoCard(
                      title: 'Create  group',
                      date: '17/12/2020',

                      indexNumber: '1',
                      height: height * 10,
                      width: width * 10,
                    ),
                    TodoCard(
                      title: 'Buy some  ribbons',
                      date: '14/12/2020',

                      indexNumber: '2',
                      height: height * 10,
                      width: width * 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text("Add To-do",style: TextStyle(fontFamily: 'Poppins'),)),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                        ),
                      ),

                      RaisedButton(
                        onPressed: null,
                        child: Text('Add',style: TextStyle(fontFamily: 'Poppins'),),
                        color: Color(0xff5c81c2),
                      )
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor:  Color(0xff5c81c2),
      ),
    );
  }
}
