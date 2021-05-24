import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:revelry_event_management_app/widgets/guest_card.dart';
import 'package:revelry_event_management_app/widgets/sizeconfig.dart';

class GuestList extends StatefulWidget {
  @override
  _GuestListState createState() => _GuestListState();
}

class _GuestListState extends State<GuestList> {
  List _filters = ["", "food preferences", 'attendance'];
  List _orderby = ["Ascending", "Descending"];

  List<DropdownMenuItem<String>> _dropDownFilterItems;
  List<DropdownMenuItem<String>> _dropDownOrderItems;

  String _currentFilter;
  String _currentOrder;

  @override
  void initState() {
    _dropDownFilterItems = getDropDownMenuItems();
    _dropDownOrderItems = getDropDownMenuItemsOrder();
    _currentFilter = _dropDownFilterItems[0].value;
    _currentOrder = _dropDownOrderItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in _filters) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItemsOrder() {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in _orderby) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return items;
  }

  void changedDropDownItem(String selected) {
    setState(() {
      _currentFilter = selected;

      _currentOrder = selected;
    });
  }

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
                        padding: EdgeInsets.fromLTRB(
                            width * 0.1, width * 8, width * 18, width * 2),
                        child: Text(
                          'Wedding Plan',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.1, width * 2, width * 10, width * 2),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Filter by:"),
                              Icon(Icons.arrow_drop_down),

                            ],
                          ),
                          SizedBox(
                            height: height * 3,
                          ),
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
                  padding: EdgeInsets.only(left: width * 8, top: width * 5),
                  child: Text(
                    'Guest List',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Filter by:'),
//                        DropdownButtonHideUnderline(
//                          child: ButtonTheme(
//
//                            child:  DropdownButton(
//                              value: _currentFilter,
//                              items: _dropDownFilterItems,
//                              onChanged: changedDropDownItem,
//                            ),
//                          ),
//                        ),


                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Order by:'),
                        new DropdownButton(
                          value: _currentOrder,
                          items: _dropDownOrderItems,
                          onChanged: changedDropDownItem,
                        ),
                      ],
                    ),
                    GuestCard(
                      name: 'Vijay',
                      food: 'Veg',
                      attending: 'Coming',
                      indexNumber: '1',
                      height: height * 10,
                      width: width * 10,
                    ),
                    GuestCard(
                      name: 'Thala',
                      food: 'Non-veg',
                      attending: 'Not Coming',
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
                  title: Text("Add Guest"),
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
                          prefixIcon: Icon(Icons.fastfood),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.label_important,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: null,
                        child: Text('add'),
                        color: Color(0xff5c81c2),
                      )
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff5c81c2),
      ),
    );
  }
}
