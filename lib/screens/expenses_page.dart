import 'package:flutter/material.dart';
import 'package:revelry_event_management_app/utilities/constants.dart';
import 'package:revelry_event_management_app/widgets/expense_card.dart';
import 'package:revelry_event_management_app/widgets/sizeconfig.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

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
                        padding: EdgeInsets.fromLTRB(width*2, width*7, width*18, width*2),
                        child: Text('Wedding Plan',style: TextStyle(fontFamily:'Poppins',fontWeight: FontWeight.bold),)),
                    Container(
                      padding: EdgeInsets.fromLTRB(width*2, width*3, width*8, width*2),
                      child: Column(

                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Filter by:"),
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
                  padding: EdgeInsets.only(left: width*8,top:width*5),

                  child: Text('Expenses',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),),
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
                    ExpenseCard(
                      title: 'Food and Bevarages',
                      amount: 'Rs .1000.00',

                      indexNumber: '1',
                      height: height * 10,
                      width: width * 10,
                    ),
                    ExpenseCard(
                      title: 'Photographer',
                      amount: 'Rs. 4000.00',

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
                  title: Center(child: Text("Add Expenses",style: TextStyle(fontFamily: 'Poppins'),)),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.title),
                          hintText: 'Expense Name'
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.monetization_on),
                          hintText: 'Amount'
                        ),

                      ),

                      Container(
                        decoration: BoxDecoration(


                        ),
                        child: RaisedButton(
                          onPressed: (){

                          },
                          child: Text('Add',style: TextStyle(color: Colors.white),),
                          color: Constant.bgColor,

                        ),
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
