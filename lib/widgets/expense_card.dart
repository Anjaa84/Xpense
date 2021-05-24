import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final String amount;
  final double height, width;
  final String indexNumber;
  const ExpenseCard(
      {Key key,  this.height, this.width, this.indexNumber, this.title, this.amount})
      : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.green,
          icon: Icons.archive,
//          onTap: () => _showSnackBar('Archive'),
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
//          onTap: () => _showSnackBar('Share'),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit,

        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
//          onTap: () => _showSnackBar('Delete'),
        ),
      ],

      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 24, 0),
        height: height,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/box.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(width * 0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: width*0.3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff5c81c2)),
                child: new SizedBox(
                  height: height * 0.5,
                  width:  height * 0.5,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(72.0),
                      child: Center(
                        child: Text(indexNumber),
                      )),
                ),
              ),
              Container(
                  padding:
                  EdgeInsets.fromLTRB(0, 0, 0, width * 0.1),
                  child: Text(title,style: TextStyle(fontFamily: 'Poppins',fontSize: 13),)),
              Container(
                  padding: EdgeInsets.only(right: width*0.3),
                  child: Text(amount,style: TextStyle(fontFamily: 'Poppins',fontWeight:FontWeight.w400),)),
            ],
          ),
        ),



      ),
    );
  }
}
