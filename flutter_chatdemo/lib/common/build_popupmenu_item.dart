import 'package:flutter/material.dart';

class BuildPopupMenuItem extends StatelessWidget{
  String menuText;
  IconData iconData;

  BuildPopupMenuItem({Key key,@required this.menuText,@required this.iconData}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return new PopupMenuItem(
        child: Row(
          children: <Widget>[
           SizedBox(
             width: 32,
             height: 32,
             child: Icon(iconData,color: Colors.white),
           ),
           Container(
             padding: EdgeInsets.only(left: 20,right: 10),
             child: Text(menuText,style: TextStyle(color: Colors.white)),
           )
          ],
        )
    );
  }

}

buildPopupMenuItemFunction(String menuText,IconData iconData){
  return new PopupMenuItem(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 32,
            height: 32,
            child: Icon(iconData,color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 10),
            child: Text(menuText,style: TextStyle(color: Colors.white)),
          )
        ],
      )
  );
}