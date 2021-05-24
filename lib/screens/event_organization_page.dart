import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:revelry_event_management_app/widgets/sizeconfig.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../theme.dart' as Theme;
// import 'InspirationsPages/CorporateEventsPage.dart';
// import 'InspirationsPages/OthersPage.dart';
// import 'InspirationsPages/SpecialEventsPage.dart';
// import 'InspirationsPages/WeddingsPage.dart';
// import 'InspirationsPages/birthdayPage.dart';

class EventOrganization extends StatefulWidget {
  @override
  _EventOrganizationState createState() => _EventOrganizationState();
}

class _EventOrganizationState extends State<EventOrganization> {
  double height, width;
  final scaffoldState = GlobalKey<ScaffoldState>();
  List<String> listOfUrls = [];

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
  ];

  List<Widget> _tiles = const <Widget>[
    const _EventTile(Icons.date_range, '2020.12.03'),
    const _EventTile(Icons.access_time, '15.00'),
    const _EventTile(Icons.location_on, 'Wellawatte'),
    const _EventTile(Icons.camera_alt, 'Fox Studio'),
  ];

  @override
  void initState() {
    super.initState();
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
                        padding: EdgeInsets.fromLTRB(width*0.1, width*8, width*29, width*1),
                        child: Text(
                          'Wedding Plan',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        )),
                    Column(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        //     Text(""),
                        //   ],
                        // ),
                        SizedBox(
                          height: height * 3,
                        ),
                        Row(
                          children: <Widget>[
                            Text(""),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: width *6, top: width * 5),
                  child: Text(
                    'Event Organization',
                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: StaggeredGridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  staggeredTiles: _staggeredTiles,
                  children: _tiles,
                  mainAxisSpacing: width * 10,
                  crossAxisSpacing: width * 10,
                  padding:
                      EdgeInsets.fromLTRB(width * 4, width, width * 6, width),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile(this.iconData, this.title);

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.safeBlockVertical;
    double width = SizeConfig.safeBlockHorizontal;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/box.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(width * 5),
      ),
      child: new InkWell(
        onTap: () {
          if (title == '2020.12.03') {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2020, 3, 5),
                maxTime: DateTime(2025, 3, 7),
                onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                },
                currentTime: DateTime.now(),
                locale: LocaleType.en);
          } else if (title == '15.00') {
            Navigator.of(context).push(
              showPicker(
                context: context,
                value: TimeOfDay.now(),
                // onChange: onTimeChanged,
              ),
            );

          }else if(title=='Wellawatte'){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Change Location"),
                  content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                  TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                ),
                ),
                        RaisedButton(
                          onPressed: null,
                          child: Text('Change'),
                          color: Color(0xff5c81c2),
                        )

                      ],
                  ),
                );
              });

          }else if(title=='Fox Studio'){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Change Photographer"),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.linked_camera),
                            hintText: 'Fox Studio'
                          ),
                        ),
                        RaisedButton(
                          onPressed: null,
                          child: Text('Change'),
                          color: Color(0xff5c81c2),
                        )

                      ],
                    ),
                  );
                });

          }
        },
        child: new Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, width, 0, width),
              child: new Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            Text(title)
          ],
        )),
      ),
    );
  }
}
