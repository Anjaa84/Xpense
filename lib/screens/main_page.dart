import 'package:flutter/material.dart';
import 'package:revelry_event_management_app/widgets/main_card.dart';
import 'package:revelry_event_management_app/widgets/sizeconfig.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              width * 2, width * 8, width * 18, width * 2),
                          child: Text(
                            'Plan everything ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              width * 2, width * 0.1, width * 18, width * 2),
                          child: Text(
                            'Under One !',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Plan Me",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 30, fontFamily: 'Poppins'),
                        ),
                        SizedBox(
                          height: height * 3,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: width * 4, bottom: width * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Upcoming Events',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 17),
                      ),
                      Row(
                        children: <Widget>[
                          Text("Sort  by:"),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('Filter by:'),
//                  new DropdownButton(
//                    value: _currentFilter,
//                    items: _dropDownFilterItems,
//                    onChanged: changedDropDownItem,
//                  ),
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('Order by:'),
//                  new DropdownButton(
//                    value: _currentOrder,
//                    items: _dropDownOrderItems,
//                    onChanged: changedDropDownItem,
//                  ),
//                ],
//              ),
                    MainCard(
                      title: "Vijay's birthday party",
                      date: '21.12.2020',
                      task: '4 tasks',
                      guests: '25 guests',
                      remainingTime: '4 hours',
                      height: height * 10,
                      width: width * 10,
                    ),
                    MainCard(
                      title: "Thalas's birthday party",
                      date: '10.12.2020',
                      task: '1 tasks',
                      guests: '100 guests',
                      remainingTime: '10 hours',
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
                return ListView(
                  children: [
                    AlertDialog(
                      title: Center(
                          child: Text(
                        "Add Event",
                        style: TextStyle(fontFamily: 'Poppins'),
                      )),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Name'),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.label_important),
                                hintText: 'Label'),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.monetization_on),
                                hintText: 'Budget'),
                          ),
                          RaisedButton(
                            onPressed: null,
                            child: Text('Add Event'),
                            color: Color(0xff5c81c2),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff5c81c2),
      ),
    );
  }
}
